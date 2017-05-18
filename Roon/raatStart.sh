#!/bin/bash

# checks for UUID in the conf files, creates one if none are pressent
if grep -Ei '[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[89AB][0-9A-F]{3}-[0-9A-F]{12}' /opt/Streamer/Roon/config/aeveestreamer.conf
then
  echo "UUID already assigned."
else
  echo "Generating UUID." \
  && newid=$(/usr/bin/uuidgen) \
  && for i in /opt/Streamer/Roon/config/*.conf; do
    sed -i "s/\(\"unique_id\":\)\s*.*$/\1    \"$newid\",/" $i
done
fi

# starts raat_app with the appropriate configuration
if [ -e /proc/asound/card1 ] ; then
  /opt/Streamer/Roon/raat_app \
  /opt/Streamer/Roon/config/aeveestreamerUSB.conf
else
  /opt/Streamer/Roon/raat_app \
  /opt/Streamer/Roon/config/aeveestreamer.conf
fi

