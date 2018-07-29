#! /bin/bash
echo -n "Enter PasteBin identifier (ie: for pastebin.com/12abAB, enter 12abAB): "
read -e LOCATOR
curl -X GET https://pastebin.com/raw/$LOCATOR | base64 -d > temp.malware
sum=$(md5sum temp.malware)
dt=$(date +"%y%m%d-%H%M")
echo "Source URL: https://pastebin.com/raw/$LOCATOR"
echo "Sample MD5: ${sum%% *}"
echo "Current timestamp: ${dt%% *}"
nm="${dt%% *}-${sum%% *}"
mv temp.malware $nm
echo "Sample saved as: $nm"
