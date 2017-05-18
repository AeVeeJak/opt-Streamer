#!/bin/sh
#starts mpd with the appropriate configuration

if [ -e /proc/asound/card1 ] ; then
  /usr/bin/mpd --no-daemon /etc/mpdUSB.conf
else
  /usr/bin/mpd --no-daemon /etc/mpdI2S.conf
fi

