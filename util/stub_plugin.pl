#!/usr/bin/perl
#
use strict;


# Read in Plugin.lua data
my $PLUGIN_DATA = "";
open (my $FP_PLUGIN, "Plugin.lua") || die print "Could not open Plugin.lua: $!\n";
while (<$FP_PLUGIN>) {
  $PLUGIN_DATA .= $_;
}
close ($FP_PLUGIN);


sub stub_plugin {
  my $line = shift;
  $line =~ s/\s+$//;

  my $plugin_name = "";
  if ($line =~ /.*\/(.*)\.lua$/) {
    $plugin_name = $1;

    my $this_plugin_data = $PLUGIN_DATA;
    $this_plugin_data =~ s/Plugin/$plugin_name/g;

    open (my $FP_THIS_PLUGIN, ">$line") || die print "Could not open '$line' for writing: $!\n";
    print $FP_THIS_PLUGIN $this_plugin_data;
    close ($FP_THIS_PLUGIN);
  }
}


if (!@ARGV) {
  open (my $FP, "plugins.files") || die print "Could not open plugins.files: $!\n";
  while (<$FP>) {
    my $line = $_;
    stub_plugin($line);
  }
  close ($FP)
} elsif (@ARGV && -e $ARGV[0]) {
  my $full_file_path = $ARGV[0];
  stub_plugin($full_file_path)
} else {
  print "Cannot read file: $ARGV[0]\n";
}
