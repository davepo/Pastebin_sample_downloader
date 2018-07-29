#! /bin/bash
echo -n "Enter PasteBin identifier (ie: for pastebin.com/12abAB, enter 12abAB): "
read -e LOCATOR
curl -X GET https://pastebin.com/raw/$LOCATOR | base64 -d > temp.malware
sum=$(md5sum temp.malware)
echo "${sum%% *}"
mv temp.malware ${sum%% *}
