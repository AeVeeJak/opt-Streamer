#!/usr/bin/perl -wT

use strict;
use CGI qw(:standard);
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);
use File::Basename;
use Archive::Tar;
use Archive::Extract;

my $upload_dir = "/home/tmp";
my $updateTar = param('updateTarchive');

print header;
print start_html;

if (!$updateTar) {
  print "There was a problem uploading your file.";
  exit;
}

my ($filename) = fileparse($updateTar);
print "Uploaded " . $filename . "\n";

if ($filename =~ m/([[:print:]]+)/) {
  $filename = $1;
} else {
  die "Filename contains invalid characters.";
}

my $upload_filehandle = upload("updateTarchive");

open (UPLOADFILE, ">", "$upload_dir/$filename") or die "Couldn't open destination file.";
binmode UPLOADFILE;

while (<$upload_filehandle>) {
  print UPLOADFILE;
}

close UPLOADFILE or die "Couldn't close destination file.";

print "File written to " . $upload_dir . "/" . $filename . "\n";
print "Unpacking files\n";
my $result = exec ("/bin/sh -c /home/tmp/unpackUpdate.sh");

if ($result =~ m/([[:print:]]+)/) {
  $result = $1;
} else {
  die "Invalid output from unpacker.\n";
}
print $result . "\n";
print "<a ref=\"index.aevee.html\" title=\"Return to Streamer Homepage\">Home</a><br>";
print end_html
