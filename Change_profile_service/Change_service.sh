#!/bin/bash

clear
while read line
do
ut=`echo $line| cut -d ',' -f1`
rt=`echo $line| cut -d ',' -f2`
dt=`echo $line| cut -d ',' -f3`


echo -e "<AddServiceRequest xmlns=\"http://broadhop.com/unifiedapi/soap/types\">
    <networkId>$ut</networkId>
    <service>
    <code>$rt</code>
    <enabled>true</enabled>
    </service>
</AddServiceRequest>" >AddServiceRequest.soap

echo -e  "<DeleteServiceRequest xmlns=\"http://broadhop.com/unifiedapi/soap/types\">
    <networkId>$ut</networkId>
    <serviceCode>$dt</serviceCode>
</DeleteServiceRequest>" >DeleteServiceRequest.soap

echo -e "=========================================================\n"
curl -v -d @AddServiceRequest.soap  -H "ContentType: text/xml; charset=utf-8" -X POST http://192.168.1.1:8080/ua/soap/
echo -e "\nuser_name AddServiceRequest $ut"
echo -e "============================================================================ \n "
curl -v -d @DeleteServiceRequest.soap  -H "ContentType: text/xml; charset=utf-8" -X POST http:/192.168.1.1:8080/ua/soap/
echo -e "\nuser_name DeleteServiceRequest  $ut"
echo -e "============================================================================ \n "
#exit
#sleep 0.0005
done < usersList.csv