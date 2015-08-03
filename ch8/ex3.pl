#!/usr/bin/perl
#
#   Write a program that takes in multiple directory names from the command line, then
#   prints out their contents. Use a function that takes a directory handle reference that
#   you made using IO::Dir

use strict;
use warnings;
use IO::Dir;
use Getopt::Long;

my @dirs;

GetOptions ( 'directory=s' => \@dirs );
foreach my $dir ( split(/,/, join(',',@dirs)) ) {
    print "Contents of $dir\n";
    read_dir( new IO::Dir($dir) );
    print "\n";
}


sub read_dir {
    my $dir_fh = shift;
    while( defined( my $file = $dir_fh->read ) ) {
        print "$file\n";
    }
}
