#!/bin/bash

while getopts "d:u:p:t:k:" arg
do
    case $arg in
        d) DBID=${OPTARG};;
        u) USERNAME=${OPTARG};;
        p) PASSWORD=${OPTARG};;
        t) TOKEN=${OPTARG};;
        k) KEYSPACE=${OPTARG};;
        *) ;;
    esac
done
echo "Database ID" $DBID
echo "User Secret" $USERNAME
echo "Password" $PASSWORD
echo "Token" $TOKEN
echo "Keyspace" $KEYSPACE

curl -L -o nb.jar https://github.com/nosqlbench/nosqlbench/releases/download/nosqlbench-4.15.104/nb.jar

BUNDLEDOWNLOAD=$(curl -s --request POST "https://api.astra.datastax.com/v2/databases/$DBID/secureBundleURL" --header "Authorization: Bearer $TOKEN" | jq -r '.downloadURL')

echo $BUNDLEDOWNLOAD

curl -L -o bundle.zip $BUNDLEDOWNLOAD

java -jar nb.jar ../labs/nosqlbench-astra-tabular.yaml astra \
username=$USERNAME \
password=$PASSWORD \
keyspace=$KEYSPACE \
secureconnectbundle="bundle.zip"