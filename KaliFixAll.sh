#!/bin/sh

black='\e[0;30m'

blue='\e[0;34m'

cyan='\e[0;36m'

red='\e[1;31m'

purple='\e[0;35m'

brown='\e[0;33m'

lightgray='\e[0;37m'

darkgray='\e[1;30m'

lightgreen='\e[1;92m'

lightblue='\e[1;34m'

lightcyan='\e[1;36m'

lightred='\e[1;31m'

lightpurple='\e[1;35m'

yellow='\e[1;33m'

white='\e[1;37m'

intro ()
{

/usr/bin/clear
cat << "BANNER"

         This Script is Written To Fix 
            Some of Kali Linux Rolling Distro 
                  Problems and Bugs.
         _  __     _ _ _____ _          _    _ _ 
        | |/ /__ _| (_)  ___(_)_  __   / \  | | |
        | ' // _` | | | |_  | \ \/ /  / _ \ | | |
        | . \ (_| | | |  _| | |>  <  / ___ \| | |
        |_|\_\__,_|_|_|_|   |_/_/\_\/_/   \_\_|_|
                                                 
              By #LyJoker ~ Libyan-Hackers
BANNER

echo ""
echo ""
/bin/echo -e $white"  The Script Gonna Make Updates and Changes To Your System..\e[0m "
/bin/echo -e $white"     Please Make Sure Your PC Battery Charger is Pluged..\e[0m "
echo ""
/bin/echo -e $red" 1)\e[0m" $cyan"choose\e[0m"   $yellow"1\e[0m"$cyan" To Update/Upgrade The Repositories\e[0m" $lightred"[Recommended For First Using !]\e[0m"
/bin/echo -e $red" 2)\e[0m" $cyan"choose\e[0m"   $yellow"2\e[0m"$cyan" To Fix The Common Problems In Kali-Rolling Distro.\e[0m"
/bin/echo -e $red" 3)\e[0m" $cyan"choose\e[0m"   $yellow"3\e[0m"$cyan" To Do All Above ( Update , Upgrade and Fix ). \e[0m"
/bin/echo -e $red" 4)\e[0m" $cyan"choose\e[0m"   $yellow"4\e[0m"$cyan" Exit The Program. \e[0m"
echo ""
/bin/echo -e -n $red"Select a\e[0m" $cyan"Choice > \e[0m"

}
intro

fun ()
{
	echo ""
	echo ""
	echo "  Replacing Repositories and Updateing APT Source list .. Please Wait .. "
	echo ""
	echo "deb http://http.kali.org/kali/ kali-rolling main contrib non-free\n\ndeb http://security.debian.org/ wheezy/updates main contrib non-free\ndeb-src http://security.debian.org/ wheezy/updates main contrib non-free\n\ndeb http://security.kali.org/kali-security kali-current/updates main contrib non-free\ndeb-src http://security.kali.org/kali-security kali-current/updates main contrib non-free\n\ndeb http://repo.kali.org/kali kali-rolling main contrib non-free\ndeb-src http://repo.kali.org/kali kali-rolling main contrib non-free\n\n# debian base repository\ndeb http://ftp.debian.org/debian wheezy main contrib non-free\ndeb-src http://ftp.debian.org/debian wheezy main contrib non-free\n\n# debian stable updates\ndeb http://ftp.debian.org/debian wheezy-updates main contrib non-free\ndeb-src http://ftp.debian.org/debian wheezy-updates main contrib non-free\n\n# debian stable backports\ndeb http://ftp.debian.org/debian wheezy-backports main contrib non-free\ndeb-src http://ftp.debian.org/debian wheezy-backports main contrib non-free">/etc/apt/sources.list
	sleep 3
	echo ""
	echo ""
	apt-get update
	apt-get dist-upgrade
	echo ""
	echo ""
	echo ""
	echo " #~ Sources.list File Updated Successfully [DONE %100]"
	echo ""
}

fun2 ()
{
	echo ""
	echo " #~ Now Fixing The Common Apps Problems . Please Wait .. "
	echo ""
	echo "==============================================================="
	echo ""
	echo " #~ Fixing VLC Player , Make it Open as root."
	`sed -i 's/geteuid/getppid/' /usr/bin/vlc`
	sleep 2
	echo "  [DONE %100]"
	echo "==============================================================="
	echo ""
	echo " #~ Fixing Wireshark Privileges Problem in ( init.lua ) file ."
	init_file=/usr/share/wireshark/init.lua
	`sed -i "39s/.*/if running_user then/" $init_file`
	`/usr/sbin/groupadd wireshark`
	`/usr/sbin/adduser root wireshark`
	sleep 2
	echo "  [DONE %100]"
	echo "==============================================================="
	echo ""
	echo " #~ Fixing Network Manager ( Device Not Managed ) Problem ."
	conf_file=/etc/NetworkManager/NetworkManager.conf
	`sed -i "5s/.*/managed=true/" $conf_file`
	sleep 2
	echo "  [DONE %100]"
	echo "==============================================================="
	echo ""
	echo " #~ Fixing BeeF Framwork Control Panel Loading Problem ."
	beef_file=/usr/share/beef-xss/config.yaml
	`sed -i "168s/.*/            enable: false/" $beef_file`
	beef2_file=/etc/beef-xss/config.yaml
	`sed -i "168s/.*/            enable: false/" $beef2_file`
	sleep 2
	echo "  [DONE %100]"
	echo "==============================================================="
	echo ""
	/bin/echo -e $white"    Done Fixing All The Bugs :D , Enjoy N00Bs ^_^ :P \e[0m"
	echo ""
	echo ""
	/bin/echo -e $lightgreen"      Make Sure You Restart The PC To Make Sure \e[0m"
	/bin/echo -e $lightgreen"  All The Changes Applied and The System Works Fine ;) .\e[0m"
	echo ""

}

quitdat ()
{
	echo ""
	echo ""
	/bin/echo -e $yellow"              o-=[ Thanks For Usinng Our Tool ]=-o"
	/bin/echo -e $yellow"   o-=[ Share To Your Friends , More Tools Are Coming Soon :D ]=-o"
	echo ""
	echo ""

}

press_enter ()
{
	echo -n " Please Select an Option .. "
    sleep 1
	intro
}

selection=
until [ "$choose" = "4" ]; do
	read choose
	case $choose in
		1 ) fun ; echo -n "Press Enter to continue" ;;
		2 ) fun2 ; echo -n "Press Enter to continue" ;;
		3 ) fun ; fun2 ; echo -n "Press Enter to continue" ;;
		4 ) quitdat ;;
		* ) press_enter
	esac
done 
