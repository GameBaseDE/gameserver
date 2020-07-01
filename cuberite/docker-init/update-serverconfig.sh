#!/bin/bash
cd /volume
mkdir -p data
files=( "MojangAPI.sqlite" "Ranks.sqlite" "banlist.sqlite" "whitelist.sqlite" )
for i in "${files[@]}"
do
	if [ ! -f $i ]; then
	    echo "Creating data/$i"
	    cp /templates/empty.sqlite data/$i
	fi
done
if [ -f settings.ini ]; then
  echo "envsubst:Updating settings.ini"
else
  echo "envsubst:Creating settings.ini"
fi
envsubst < /templates/settings.default.ini > settings.ini
if [ -f webadmin.ini ]; then
  echo "envsubst:Updating webadmin.ini"
else
  echo "envsubst:Creating webadmin.ini"
fi
envsubst < /templates/webadmin.default.ini > webadmin.ini
chown -R 1000:1000 /volume