#!/bin/sh
dpkg-scanpackages ./debfiles/ > ./Packages;
#sed -i -e '/^SHA/d' ./Packages;
bzip2 -c9k ./Packages > ./Packages.bz2;
printf "Origin: tweaks4roothide's Repo\nLabel: tweaks4roothide\nSuite: stable\nVersion: 1.0\nCodename: tweaks4roothide\nArchitecture: iphoneos-arm64e\nComponents: main\nDescription: tweaks4roothide's Tweaks\nMD5Sum:\n "$(cat ./Packages | md5sum | cut -d ' ' -f 1)" "$(stat ./Packages --printf="%s")" Packages\n "$(cat ./Packages.bz2 | md5sum | cut -d ' ' -f 1)" "$(stat ./Packages.bz2 --printf="%s")" Packages.bz2\n" >Release;
exit 0;