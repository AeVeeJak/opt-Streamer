#!/usr/bin/perl -wT

use strict;
use CGI qw(:standard);
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);
use File::Basename;

my $upload_dir = "/opt/Streamer";
my $updateTar = param('roonUpdate');

print header;
print start_html;

if (!$updateTar) {
  print "There was a problem uploading your file.";
  exit;
}

my ($filename) = fileparse($updateTar);
print "Uploaded " . $filename . "<br>";

if ($filename =~ m/(RoonUpdate)-[0-9]{2}\.[0-9]{2})/) {
  $filename = $1;
} else {
  die "Filename contains invalid characters.";
}

my $upload_filehandle = upload("roonUpdate");

open (UPLOADFILE, ">", "$upload_dir/$filename") or die "Couldn't open destination file.";
binmode UPLOADFILE;

while (<$upload_filehandle>) {
  print UPLOADFILE;
}

close UPLOADFILE or die "Couldn't close destination file.";

print "File written to " . $upload_dir . "/" . $filename . "<br>";
print "Unpacking files<br>";
system ("/opt/Streamer/unpackUpdate.sh");

print $?;
print "Done.";

print Link({-rel=>'Return to Streamer Homepage',
            -href=>'../index.aevee.html'});
# print "<a href=\"../index.aevee.html\" title=\"Return to Streamer Homepage\">Home</a><br>";
print end_html
