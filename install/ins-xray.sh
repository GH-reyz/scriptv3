#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="GH-reyz"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
# Valid Script
VALIDITY () {
    today=`date -d "0 days" +"%Y-%m-%d"`
    Exp1=$(curl https://raw.githubusercontent.com/${GitUser}/registerv3/main/ip.conf | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mYOUR SCRIPT ACTIVE..\e[0m"
    else
    echo -e "\e[31mYOUR SCRIPT HAS EXPIRED!\e[0m";
    echo -e "\e[31mPlease renew your ipvps first\e[0m"
    exit 0
fi
}
IZIN=$(curl https://raw.githubusercontent.com/${GitUser}/registerv3/main/ip.conf | awk '{print $5}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
VALIDITY
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mPlease buy script first\e[0m"
exit 0
fi
clear

# EMAIL & DOMAIN
emailcf=$(cat /usr/local/etc/xray/email)
domain=$(cat /root/domain)

apt install iptables iptables-persistent -y
apt install curl socat xz-utils wget apt-transport-https gnupg gnupg2 gnupg1 dnsutils lsb-release -y 
apt install socat cron bash-completion ntpdate -y
ntpdate pool.ntp.org
apt -y install chrony
timedatectl set-ntp true
systemctl enable chronyd && systemctl restart chronyd
systemctl enable chrony && systemctl restart chrony
timedatectl set-timezone Asia/Kuala_Lumpur
chronyc sourcestats -v
chronyc tracking -v
date

# Acc Trojan XRAY TCP TLS
mkdir -p /usr/local/etc/xray/
touch /usr/local/etc/xray/akunxtr.conf
touch /usr/local/etc/xray/akunxtrgrpc.conf

# CHECK VERSION XRAY CORE
latest_version="$(curl -s https://api.github.com/repos/XTLS/Xray-core/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"

# Installation Xray Core
xraycore_link="https://github.com/XTLS/Xray-core/releases/download/v$latest_version/xray-linux-64.zip"

# Make Main Directory
mkdir -p /usr/bin/xray
mkdir -p /etc/xray

# Unzip Xray Linux 64
cd `mktemp -d`
curl -sL "$xraycore_link" -o xray.zip
unzip -q xray.zip && rm -rf xray.zip
mv xray /usr/local/bin/xray
chmod +x /usr/local/bin/xray

# Make Folder XRay
mkdir -p /var/log/xray/

# // KILL PORT
systemctl stop nginx

# Installation Xray Core 2023
mv /usr/local/bin/xray /usr/local/bin/xray.bak && wget -q -O /usr/local/bin/xray "https://raw.githubusercontent.com/vinstechmy/xray-core/main/XRAY/xray" && chmod 755 /usr/local/bin/xray

# generate certificates
mkdir /root/.acme.sh
curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
chmod +x /root/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /usr/local/etc/xray/xray.crt --keypath /usr/local/etc/xray/xray.key --ecc

# // RESTART
systemctl restart nginx
service squid start

uuid=$(cat /proc/sys/kernel/random/uuid)
cat> /usr/local/etc/xray/config.json << END
{
  "log": {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
       },
    "inbounds": [
        {
            "port": 443,
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "${uuid}",
                        "flow": "xtls-rprx-direct",
                        "level": 0
#xray-vless-xtls
                    }
                ],
                "decryption": "none",
                "fallbacks": [
                    {
                        "alpn": "h2",
                        "dest": 1310,
                        "xver": 0
                    },
                    {
                        "dest": 1311,
                        "xver": 1
                    },
                    {
                        "path": "/xray-vmessws-tls",
                        "dest": 1312,
                        "xver": 1
                    },
                    {                    
                        "path": "/reyzvpn-tls",
                        "dest": 1313,
                        "xver": 1
                    },
                    {                    
                        "path": "/xray-trojanws-tls",
                        "dest": 1314,
                        "xver": 1
                    }
                ]
            },
            "streamSettings": {
                "network": "tcp",
                "security": "xtls",
                "xtlsSettings": {
                    "alpn": [
                        "h2",
                        "http/1.1"
                    ],
                    "certificates": [
                        {
                            "certificateFile": "/usr/local/etc/xray/xray.crt",
                            "keyFile": "/usr/local/etc/xray/xray.key"
                        }
                    ]
                }
            }
        },
        {
            "port": 1311,
            "listen": "127.0.0.1",
            "protocol": "trojan",
            "settings": {
                "clients": [
                    {
                        "id": "${uuid}",
                        "password": "xxxxxx"
#trojan
                    }
                ],
                "fallbacks": [
                    {
                        "dest": 8181
                    }
                ]
            },
            "streamSettings": {
                "network": "tcp",
                "security": "none",
                "tcpSettings": {
                    "acceptProxyProtocol": true
                }
            }
        },
        {
            "port": 1310,
            "listen": "127.0.0.1",
            "protocol": "trojan",
            "settings": {
                "clients": [
                    {
                        "id": "${uuid}",
                        "password": "xxxxxx"
#trojangrpc
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "grpc",
                "security": "none",
                "grpcSettings": {
                    "serviceName": "grpc"
                }
            }
        },
        {
            "port": 1312,
            "listen": "127.0.0.1",
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "${uuid}",
                        "alterId": 0,
                        "level": 0
#xray-vmess-tls
                    }
                ]
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "acceptProxyProtocol": true,
                    "path": "/xray-vmessws-tls"
                }
            }
        },
        {
            "port": 1313,
            "listen": "127.0.0.1",
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "${uuid}",
                        "level": 0
#xray-vless-tls
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "acceptProxyProtocol": true,
                    "path": "/reyzvpn-tls"
                }
            }
        },
        {
		   "port": 1314,
            "listen": "127.0.0.1",
		    "protocol": "trojan",
		    "settings": {
		       "clients": [
		            {
		             "id": "${uuid}",
		             "password": "XXX"
#xray-trojan-tls
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "acceptProxyProtocol": true,
               "path": "/xray-trojanws-tls"
                }
            }
        }
    ],
    "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    },
    {
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    }
  ],
  "routing": {
    "rules": [
      {
        "type": "field",
        "ip": [
          "0.0.0.0/8",
          "10.0.0.0/8",
          "100.64.0.0/10",
          "169.254.0.0/16",
          "172.16.0.0/12",
          "192.0.0.0/24",
          "192.0.2.0/24",
          "192.168.0.0/16",
          "198.18.0.0/15",
          "198.51.100.0/24",
          "203.0.113.0/24",
          "::1/128",
          "fc00::/7",
          "fe80::/10"
        ],
        "outboundTag": "blocked"
      },
      {
        "inboundTag": [
          "api"
        ],
        "outboundTag": "api",
        "type": "field"
      },
      {
        "type": "field",
        "outboundTag": "blocked",
        "protocol": [
          "bittorrent"
        ]
      }
    ]
  },
  "stats": {},
  "api": {
    "services": [
      "StatsService"
    ],
    "tag": "api"
  },
  "policy": {
    "levels": {
      "0": {
        "statsUserDownlink": true,
        "statsUserUplink": true
      }
    },
    "system": {
      "statsInboundUplink": true,
      "statsInboundDownlink": true
    }
  }
}
END
cat> /usr/local/etc/xray/none.json << END
{
  "log": {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
  },
  "inbounds": [
    {
            "port": 8080,
            "protocol": "vmess",
            "settings": {
            "clients": [
                {
                  "id": "${uuid}",
                  "alterId": 0,
                  "level": 0
#xray-vmess-nontls
                }
            ]
        },
        "streamSettings": {
            "network": "ws",
            "security": "none",
            "wsSettings": {
                "path": "/reyzvpn-none-tls",
                "headers": {
                   "Host": ""
                 }
             },
             "quicSettings": {}
          },
          "sniffing": {
             "enabled": true,
             "destOverride": [
                "http",
                "tls"
                ]
            }
        },
        {
            "port": 80,
            "protocol": "vless",
            "settings": {
            "clients": [
                {
                  "id": "${uuid}"
#xray-vless-nontls
                }
            ],
            "decryption": "none"
         },
         "streamSettings": {
            "network": "ws",
            "security": "none",
            "wsSettings": {
            "path": "/reyzvpn-ntls",
            "headers": {
                "Host": ""
               }
            },
            "quicSettings": {}
          },
          "sniffing": {
              "enabled": true,
              "destOverride": [
                 "http",
                 "tls"
             ]
          }
       }
    ],
    "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    },
    {
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    }
  ],
  "routing": {
    "rules": [
      {
        "type": "field",
        "ip": [
          "0.0.0.0/8",
          "10.0.0.0/8",
          "100.64.0.0/10",
          "169.254.0.0/16",
          "172.16.0.0/12",
          "192.0.0.0/24",
          "192.0.2.0/24",
          "192.168.0.0/16",
          "198.18.0.0/15",
          "198.51.100.0/24",
          "203.0.113.0/24",
          "::1/128",
          "fc00::/7",
          "fe80::/10"
        ],
        "outboundTag": "blocked"
      },
      {
        "inboundTag": [
          "api"
        ],
        "outboundTag": "api",
        "type": "field"
      },
      {
        "type": "field",
        "outboundTag": "blocked",
        "protocol": [
          "bittorrent"
        ]
      }
    ]
  },
  "stats": {},
  "api": {
    "services": [
      "StatsService"
    ],
    "tag": "api"
  },
  "policy": {
    "levels": {
      "0": {
        "statsUserDownlink": true,
        "statsUserUplink": true
      }
    },
    "system": {
      "statsInboundUplink": true,
      "statsInboundDownlink": true
    }
  }
}
END
# starting xray vmess ws tls core on sytem startup
cat> /etc/systemd/system/xray.service << END
[Unit]
Description=Xray Service
Documentation=https://github.com/xtls
After=network.target nss-lookup.target

[Service]
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray run -config /usr/local/etc/xray/config.json
Restart=on-failure
RestartPreventExitStatus=23
LimitNPROC=10000
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target

END

# starting xray vmess ws tls core on sytem startup
cat> /etc/systemd/system/xray@.service << END
[Unit]
Description=Xray Service
Documentation=https://github.com/xtls
After=network.target nss-lookup.target

[Service]
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray run -config /usr/local/etc/xray/%i.json
Restart=on-failure
RestartPreventExitStatus=23
LimitNPROC=10000
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target

END

iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 8080 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 1310 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 1311 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 1312 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 1313 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 1314 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 443 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 80 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 8080 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 1310 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 1311 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 1312 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 1313 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 1314 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# enable xray tls
systemctl daemon-reload
systemctl enable xray.service
systemctl start xray.service
systemctl restart xray

# enable xray none tls
systemctl daemon-reload
systemctl enable xray@none
systemctl start xray@none
systemctl restart xray@none

# download script
cd /usr/bin
wget -O port-xray "https://raw.githubusercontent.com/${GitUser}/scriptv3/main/change-port/port-xray.sh"
wget -O port-trojan "https://raw.githubusercontent.com/${GitUser}/scriptv3/main/change-port/port-trojan.sh"
wget -O certv2ray "https://raw.githubusercontent.com/${GitUser}/scriptv3/main/cert.sh"
wget -O trojaan "https://raw.githubusercontent.com/${GitUser}/scriptv3/main/menu/trojaan.sh"
wget -O xraay "https://raw.githubusercontent.com/${GitUser}/scriptv3/main/menu/xraay.sh"
chmod +x port-xray
chmod +x port-trojan
chmod +x certv2ray
chmod +x trojaan
chmod +x xraay

cd
rm -f ins-xray.sh
mv /root/domain /usr/local/etc/xray/domain
