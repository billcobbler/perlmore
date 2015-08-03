#!/usr/bin/perl
#
#   The Professor has to read a logfile that looks like:
#
#       Gilligan: 1 coconut
#       Skipper: 3 coconuts
#       Gilligan: 1 banana
#       Ginger: 2 papayas
#       Professor: 3 coconuts
#       MaryAnn: 2 papayas
#   
#   He wants to write a series of files, called gilligan.info, maryann.info, and so on.
#   Each file should contain all the lines that begin with that name. (Names are always
#   delimited by the trailing colon.) At the end, gilligan.info should start with:
#
#   Gilligan: 1 coconut
#   Gilligan: 1 banana
#
#   Now the logfile is large, and the coconut-powered computer is not veryfast, so he
#   wants to process the input file in one pass and write all output files in parallel. How
#   does he do it?
#
#   Hint: use a hash, keyed by the castaway name, holding IO::File objects for each output
#   file. Create them as necessary.

use strict;
use warnings;
use IO::File;

my %output;
my $read_fh = IO::File->new('ex2.log', 'r');

while (<$read_fh>){
    my ($name, $line) = split(':', $_);
    $name = lc $name;
    unless (defined $output{$name}) {
        #create the fh
        $output{$name} = IO::File->new("$name.info", 'w');
    }
    print {$output{$name}} $_;
}

