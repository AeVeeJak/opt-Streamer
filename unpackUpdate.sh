#!/bin/bash
 if [ -e "/opt/Streamer/RoonUpdate.tar.gz" ]
 then
   echo "Update file found" && \
   chown root:root /opt/Streamer/RoonUpdate.tar.gz || echo "cannot chown"
   chmod 0777 /opt/Streamer/RoonUpdate.tar.gz || echo "cannot chmod"
   tar -xvf "/opt/Streamer/RoonUpdate.tar.gz" || echo "cannot untar"
 else
   echo "Update file not Found"
 fi
