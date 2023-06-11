#!/bin/bash

MYIP=$(wget -qO- icanhazip.com)

IZIN=$(curl https://raw.githubusercontent.com/GH-reyz/registerv3/main/ip.conf | grep $MYIP | awk '{print $4}')

if [ $MYIP = $IZIN ]; then

    clear

else

    echo -e ""

    echo -e "${green}ACCESS DENIED...PM TELEGRAM OWNER${NC}"

    exit 1

fi

[[ ! -f /usr/share/figlet/Crazy.flf ]] && {

    git clone https://github.com/xero/figlet-fonts.git

    rm -rf /root/figlet-fonts/.git

    mv /root/figlet-fonts/* /usr/share/figlet

    rm -rf /root/figlet-fonts

}

[[ ! -d /root/.fontsam ]] && {

    mkdir /root/.fontsam

    touch /root/.fontsam/fontlist

    touch /root/.fontsam/count

    curl -Ss https://raw.githubusercontent.com/syfqsamvpn/font/main/list >/root/.fontsam/fontlist

    echo "figlet -f slant SAMVPN -c | lolcat" >/root/.fontsam/banner

    echo "SAMVPN" >/root/.fontsam/bannername

}

colour_change() {

    banner=$(sed -n '1p' /root/.fontsam/bannername)

    STOP="\e[0m"

    echo "Please Choose Colour"

    echo""

    echo "1.  Red"

    echo "2.  Orange"

    echo "3.  Blue"

    echo "4.  Green"

    echo "5.  Cyan"

    echo "6.  Yellow"

    echo "7.  Purple"

    echo "8.  White"

    echo "9.  Light Blue"

    echo "10. Grey"

    echo ""

    read -p "Select menu : " choose

    echo -e ""

    case $choose in

    1)

        clear

        colour="\e[31m"

        ;;

    2)

        clear

        colour="\e[33m"

        ;;

    3)

        clear

        colour="\e[94m"

        ;;

    4)

        clear

        colour="\e[92m"

        ;;

    5)

        clear

        colour="\e[36m"

        ;;

    6)

        clear

        colour="\e[1;33m"

        ;;

    7)

        clear

        colour="\e[1;35m"

        ;;

    8)

        clear

        colour="\e[1;37m"

        ;;

    9)

        clear

        colour="\e[1;34m"

        ;;

    10)

        clear

        colour="\e[37m"

        ;;

    esac

    echo -n >/root/.fontsam/count

    echo "0" >/root/.fontsam/count

    for font in $(cat /root/.fontsam/fontlist | awk '{print $2}'); do

        number=$(cat /root/.fontsam/count)

        new=$(($number + 1))

        result=$(figlet -f "$font" $banner -c)

        echo "($new)"

        printf "${colour}"

        echo "$result"

        printf "${STOP}"

        echo ""

        echo "$new" >/root/.fontsam/count

    done

    read -p "Please Select Banner : " result

    pilihan=font$result

    final=$(grep $pilihan /root/.fontsam/fontlist | awk '{print $2}' | sed -n '1p')

    clear

    printf "${colour}"

    figlet -f "$final" $banner -c

    printf "${STOP}"

    echo "printf '${colour}'" >/root/.fontsam/banner

    echo "figlet -f "$final" $banner -c" >>/root/.fontsam/banner

    echo "printf '${STOP}'" >>/root/.fontsam/banner

    read -n 1 -s -r -p "Press any key to back on menu"

    main_menu

}

colour_rainbow() {

    banner=$(sed -n '1p' /root/.fontsam/bannername)

    echo -n >/root/.fontsam/count

    echo "0" >/root/.fontsam/count

    for font in $(cat /root/.fontsam/fontlist | awk '{print $2}'); do

        number=$(cat /root/.fontsam/count)

        new=$(($number + 1))

        result=$(figlet -f "$font" $banner -c)

        echo "($new)"

        echo "$result"

        echo ""

        echo "$new" >/root/.fontsam/count

    done

    read -p "Please Select Banner : " result

    pilihan=font$result

    final=$(grep $pilihan /root/.fontsam/fontlist | awk '{print $2}' | sed -n '1p')

    clear

    figlet -f "$final" $banner -c | lolcat

    echo "figlet -f "$final" $banner -c | lolcat" >/root/.fontsam/banner

    read -n 1 -s -r -p "Press any key to back on menu"

    main_menu

}

change_banner() {

    read -p "Banner Name : " banner

    [[ -z $banner ]] && {

        clear

        echo "Please Input Any Name"

        read -n 1 -s -r -p "Press any key to back on menu"

        main_menu

    }

    echo "$banner" >/root/.fontsam/bannername

    if [ "$(grep -wc lolcat /root/.fontsam/banner)" != '0' ]; then

        name=$(cut -d' ' -f4 /root/.fontsam/banner)

        sed -i "s/$name/$banner/g" /root/.fontsam/banner

    fi

    echo "done"

    read -n 1 -s -r -p "Press any key to back on menu"

    main_menu

}

custom_banner() {

    echo "Please Input Custom Ascii at /root/customfont"

    echo -ne "Already Input Custom Ascii ? (y/n)? "

    read answer

    if [ "$answer" == "${answer#[Yy]}" ]; then

        rm -f /root/customfont

        main_menu

    else

        if [ "$(wc -l /root/customfont | cut -d' ' -f1)" = '0' ]; then

            clear

            echo "Please Change Ascii At /root/customfont"

            read -n 1 -s -r -p "Press any key to back on menu"

            rm -f /root/customfont

            main_menu

        else

            echo "echo '" >/root/.fontsam/banner

            cat /root/customfont >>/root/.fontsam/banner

            echo "'" >>/root/.fontsam/banner

            clear

            echo "DONE"

            read -n 1 -s -r -p "Press any key to back on menu"

            rm -f /root/customfont

            main_menu

        fi

    fi

}

change_posi() {

    if [ "$(grep -wc 'printf' /root/.fontsam/banner)" != '0' ]; then

        current_posi=$(awk '{print $5}' /root/.fontsam/banner | sed -n '2p')

    else

        current_posi=$(awk '{print $5}' /root/.fontsam/banner)

    fi

    if [ "$(grep -wc 'printf' /root/.fontsam/banner)" != '0' ]; then

        if [ "$(awk '{print $5}' /root/.fontsam/banner | sed -n '2p')" = '-c' ]; then

            posi=Center

        elif [ "$(awk '{print $5}' /root/.fontsam/banner | sed -n '2p')" = '-l' ]; then

            posi=Left

        elif [ "$(awk '{print $5}' /root/.fontsam/banner | sed -n '2p')" = '-r' ]; then

            posi=Right

        fi

    else

        if [ "$(awk '{print $5}' /root/.fontsam/banner)" = '-c' ]; then

            posi=Center

        elif [ "$(awk '{print $5}' /root/.fontsam/banner)" = '-l' ]; then

            posi=Left

        elif [ "$(awk '{print $5}' /root/.fontsam/banner)" = '-r' ]; then

            posi=Right

        fi

    fi

    echo "BANNER POSITION  : $posi"

    echo ""

    echo "[1] CENTER"

    echo "[2] LEFT"

    echo "[3] RIGHT"

    echo ""

    read -p "SELECT OPTION ABOVE [PRESS X TO BACK MAIN MENU]: " menu_posi

    echo -e ""

    case $menu_posi in

    1)

        clear

        sed -i "s/$current_posi/-c/g" /root/.fontsam/banner

        ;;

    2)

        clear

        sed -i "s/$current_posi/-l/g" /root/.fontsam/banner

        ;;

    3)

        clear

        sed -i "s/$current_posi/-r/g" /root/.fontsam/banner

        ;;

    x)

        clear

        main_menu

        ;;

    esac

    read -n 1 -s -r -p "Press any key to back on menu"

    main_menu

}

main_menu() {

    banner=$(sed -n '1p' /root/.fontsam/bannername)

    if [ "$(grep -wc 'printf' /root/.fontsam/banner)" != '0' ]; then

        if [ "$(awk '{print $5}' /root/.fontsam/banner | sed -n '2p')" = '-c' ]; then

            posi=Center

        elif [ "$(awk '{print $5}' /root/.fontsam/banner | sed -n '2p')" = '-l' ]; then

            posi=Left

        elif [ "$(awk '{print $5}' /root/.fontsam/banner | sed -n '2p')" = '-r' ]; then

            posi=Right

        fi

    else

        if [ "$(awk '{print $5}' /root/.fontsam/banner)" = '-c' ]; then

            posi=Center

        elif [ "$(awk '{print $5}' /root/.fontsam/banner)" = '-l' ]; then

            posi=Left

        elif [ "$(awk '{print $5}' /root/.fontsam/banner)" = '-r' ]; then

            posi=Right

        fi

    fi

    clear

    bash /root/.fontsam/banner

    echo ""

    if [ "$(grep -wc lolcat /root/.fontsam/banner)" = '0' ]; then        echo "YOUR BANNER NAME : CUSTOM"

        echo "BANNER POSITION  : null"

    else

        echo "YOUR BANNER NAME : $banner"

        echo "BANNER POSITION  : $posi"

    fi

    echo ""

    echo "[1] CHANGE NORMAL COLOUR"

    echo "[2] CHANGE RAINBOW COLOUR"

    echo "[3] CHANGE BANNER NAME"

    echo "[4] CHANGE CUSTOM BANNER"

    echo "[5] CHANGE BANNER POSITION"

    echo ""

    read -p "SELECT OPTION ABOVE [PRESS X TO BACK MAIN MENU]: " menu

    echo -e ""

    case $menu in

    1)

        clear

        colour_change

        ;;

    2)

        clear

        colour_rainbow

        ;;

    3)

        clear

        change_banner

        ;;

    4)

        clear

        custom_banner

        ;;

    5)

        clear

        change_posi

        ;;

    x)

        clear

        menu

        ;;

    esac

}

main_menu
