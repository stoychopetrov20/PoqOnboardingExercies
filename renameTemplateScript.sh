#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

OLD_NAME_1="Template Client"
OLD_NAME_2="TemplateClient"
OLD_NAME_3="templateclient"
OLD_NAME_4="template-client"

echo 'Write client name with Title Case format "New Client"'
read varname

NEW_NAME_1=$varname
NEW_NAME_2="${NEW_NAME_1// /}"
NEW_NAME_3=$(echo "$NEW_NAME_2" | tr '[:upper:]' '[:lower:]')
NEW_NAME_4=$(echo "${NEW_NAME_1// /-}" | tr '[:upper:]' '[:lower:]')

cd "${DIR}"

find . -name "*${OLD_NAME_1}*" ! -path '*/\.git/*' -depth | while read f; do mv "$f" `echo $f | sed -E "s/(.*\/.*)${OLD_NAME_1}(.*)/\1${NEW_NAME_1}\2/"`; done
find . -name "*${OLD_NAME_2}*" ! -path '*/\.git/*' -depth | while read f; do mv "$f" `echo $f | sed -E "s/(.*\/.*)${OLD_NAME_2}(.*)/\1${NEW_NAME_2}\2/"`; done
find . -name "*${OLD_NAME_3}*" ! -path '*/\.git/*' -depth | while read f; do mv "$f" `echo $f | sed -E "s/(.*\/.*)${OLD_NAME_3}(.*)/\1${NEW_NAME_3}\2/"`; done
find . -name "*${OLD_NAME_4}*" ! -path '*/\.git/*' -depth | while read f; do mv "$f" `echo $f | sed -E "s/(.*\/.*)${OLD_NAME_4}(.*)/\1${NEW_NAME_4}\2/"`; done
find . -type f  ! '(' -path '*/\.git/*' -o -name '.gitmodules' -o -name '*.jar' -o -name '*.jks' -o -name '*.png' -o -name 'renameTemplateScript.sh' ')' -exec sed -i '' "s/${OLD_NAME_1}/${NEW_NAME_1}/g" {} \;
find . -type f  ! '(' -path '*/\.git/*' -o -name '.gitmodules' -o -name '*.jar' -o -name '*.jks' -o -name '*.png' -o -name 'renameTemplateScript.sh' ')' -exec sed -i '' "s/${OLD_NAME_2}/${NEW_NAME_2}/g" {} \;
find . -type f  ! '(' -path '*/\.git/*' -o -name '.gitmodules' -o -name '*.jar' -o -name '*.jks' -o -name '*.png' -o -name 'renameTemplateScript.sh' ')' -exec sed -i '' "s/${OLD_NAME_3}/${NEW_NAME_3}/g" {} \;
find . -type f  ! '(' -path '*/\.git/*' -o -name '.gitmodules' -o -name '*.jar' -o -name '*.jks' -o -name '*.png' -o -name 'renameTemplateScript.sh' ')' -exec sed -i '' "s/${OLD_NAME_4}/${NEW_NAME_4}/g" {} \;
find . -name "*.DS_Store" -delete
rm README.md
echo "# Poq.Android.${OLD_NAME_2}" > README.md

cd Keystore 
keytool -delete -alias "${OLD_NAME_4}-release" -keystore PoqAppKeystore.jks -storepass poq1poq
keytool -delete -alias "${OLD_NAME_4}-uat" -keypass leanP0q. -keystore PoqAppKeystore.jks -storepass poq1poq
keytool -genkey -keyalg RSA -alias "${NEW_NAME_4}-release" -keystore PoqAppKeystore.jks -storepass poq1poq -validity 9360 -keysize 2048 -dname "O=POQ, L=London, C=UK"
keytool -genkey -keyalg RSA -alias "${NEW_NAME_4}-uat" -keypass leanP0q. -keystore PoqAppKeystore.jks -storepass poq1poq -validity 9360 -keysize 2048 -dname "O=POQ, L=London, C=UK"
keytool -list -v -storepass poq1poq -keystore PoqAppKeystore.jks > keystore.list

cd ..
rm renameTemplateScript.sh