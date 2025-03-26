#!/bin/sh

#wget -q "--no-check-certificate" https://raw.githubusercontent.com/tarekzoka/worldcam/main/installer.sh -O - | /bin/sh

##########################################
version=4.9
#############################################################
TEMPATH=/tmp
OPKGINSTALL="opkg install --force-reinstall"
MY_IPK="enigma2-plugin-extensions-worldcam_4.9_all.ipk"
MY_DEB="enigma2-plugin-extensions-worldcam_4.9_all.deb"
MY_URL="https://raw.githubusercontent.com/tarekzoka/worldcam/main"
# remove old version #
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/worldcam

echo ""
# Download and install plugin
cd /tmp
set -e
     wget "$MY_URL/$MY_IPK"
  wait
     wget "$MY_URL/$MY_DEB"

 if which dpkg > /dev/null 2>&1; then
		dpkg -i --force-overwrite $MY_DEB; apt-get install -f -y
	else
		$OPKGINSTALL $MY_IPK
	fi
echo "================================="
set +e
cd ..
wait
rm -f /tmp/*.ipk
rm -f /tmp/*.deb
	if [ $? -eq 0 ]; then
echo ">>>>  SUCCESSFULLY INSTALLED <<<<"
fi
		echo "********************************************************************************"
echo "   UPLOADED BY  >>>>   TARK_HANFY "   
sleep 4;
		echo ". >>>>         RESTARING     <<<<"
echo "**********************************************************************************"
wait
killall -9 enigma2
exit 0





