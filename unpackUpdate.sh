#!/bin/bash
 if [ -e "/opt/Streamer/Update.tar.gz" ]
 then
   echo "Update file found" && \
   chown root:root /opt/Streamer/Update.tar.gz || echo "cannot chown"
   chmod 0777 /opt/Streamer/Update.tar.gz || echo "cannot chmod"
   tar -xvf "/opt/Streamer/Update.tar.gz" || echo "cannot untar"
 else
   echo "Update file not Found"
 fi
