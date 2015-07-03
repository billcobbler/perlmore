#!/usr/bin/perl

# Write a program that takes a list of filenames on the command line and uses grep to
# select the ones whose size in bytes is less than 1000. Use map to transform the strings
# in this list, putting four space characters in front of each and a newline character
# after. Print the resulting list.

use warnings;
use strict;

my @files = grep((stat($_))[7]<1000,@ARGV);
map { print "    $_\n"; } @files;

