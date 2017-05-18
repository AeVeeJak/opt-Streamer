# opt-Streamer
final location for running files on the streamer

Contains:
  Roon Ready application and config files for launch
  shell script to launch Roon Ready app
  raatapp.service file for systemd
  shell script to launch MPD
  mpd.service file for systemd
  shell script to luanch UART reporter program
  UART reporter program
  uartreporter.service file for systemd
  source file for reporter program
  a copy of the /var/www/ dir
  shell script service to update Roon Ready app and files
  
NOTE, the updater needs 4755 permissions (-rwsr-xr-x) and root ownership to function, but git does not preserve the setuid bit
