#!/bin/sh
dpkg-scanpackages ./debfiles/ > ./Packages;
#sed -i -e '/^SHA/d' ./Packages;
bzip2 -c9k ./Packages > ./Packages.bz2;
printf "Origin: Tweaks4Roothide's Repo\nLabel: Tweaks4Roothide\nSuite: stable\nVersion: 1.0\nCodename: Tweaks4Roothide\nArchitecture: iphoneos-arm64e\nComponents: main\nDescription: Tweaks4Roothide's Tweaks\nMD5Sum:\n "$(cat ./Packages | md5sum | cut -d ' ' -f 1)" "$(stat ./Packages --printf="%s")" Packages\n "$(cat ./Packages.bz2 | md5sum | cut -d ' ' -f 1)" "$(stat ./Packages.bz2 --printf="%s")" Packages.bz2\n" >Release;
exit 0;