#!/bin/sh


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
echo ""
echo "  The Script Gonna Make Updates and Changes To Your System.. "
echo "     Please Make Sure Your PC Battery Charger is Pluged.. "
echo ""
echo ""
echo "  Replacing Repositories and Updateing APT Source list .. Please Wait .. "
echo ""
echo "deb http://http.kali.org/kali/ kali-rolling main contrib non-free\n\ndeb http://security.debian.org/ wheezy/updates main contrib non-free\ndeb-src http://security.debian.org/ wheezy/updates main contrib non-free\n\ndeb http://security.kali.org/kali-security kali-current/updates main contrib non-free\ndeb-src http://security.kali.org/kali-security kali-current/updates main contrib non-free\n\ndeb http://repo.kali.org/kali kali-rolling main contrib non-free\ndeb-src http://repo.kali.org/kali kali-rolling main contrib non-free\n\n# debian base repository\ndeb http://ftp.debian.org/debian wheezy main contrib non-free\ndeb-src http://ftp.debian.org/debian wheezy main contrib non-free\n\n# debian stable updates\ndeb http://ftp.debian.org/debian wheezy-updates main contrib non-free\ndeb-src http://ftp.debian.org/debian wheezy-updates main contrib non-free\n\n# debian stable backports\ndeb http://ftp.debian.org/debian wheezy-backports main contrib non-free\ndeb-src http://ftp.debian.org/debian wheezy-backports main contrib non-free">/etc/apt/sources.list
sleep 5
echo ""
echo ""
apt-get update
echo ""
echo ""
echo ""
echo " #~ Sources.list File Updated Successfully [DONE %100]"
echo ""
echo ""
echo ""
echo ""
echo "=================================================="
echo ""
echo "#~ Fixing VLC Player , Make it Open as root."
`sed -i 's/geteuid/getppid/' /usr/bin/vlc`
echo "[DONE %100]"
echo "=================================================="
echo ""
echo "#~ Fixing Wireshark Privileges Problem in ( init.lua ) file ."
init_file=/usr/share/wireshark/init.lua
`sed -i "39s/.*/if running_user then/" $init_file`
`/usr/sbin/groupadd wireshark`
`/usr/sbin/adduser root wireshark`
echo "[DONE %100]"
echo "=================================================="
echo ""
echo "#~ Fixing Network Manager ( Device Not Managed ) Problem ."
conf_file=/etc/NetworkManager/NetworkManager.conf
`sed -i "5s/.*/managed=true/" $conf_file`
echo "[DONE %100]"
echo "=================================================="
echo ""
echo "#~ Fixing BeeF Framwork Control Panel Loading Problem ."
beef_file=/usr/share/beef-xss/config.yaml
`sed -i "168s/.*/            enable: false/" $beef_file`
beef2_file=/etc/beef-xss/config.yaml
`sed -i "168s/.*/            enable: false/" $beef2_file`
echo "[DONE %100]"
echo "=================================================="
echo ""
echo " Done Fixing All The Bugs :D , Enjoy N00bs ^_^ :P "
















