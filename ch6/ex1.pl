#!/usr/bin/perl
# The program from Exercise 2 in Chapter 5 needs to read the entire 
# datafile each time it runs. However, the Professor has a new 
# router logfile each day and doesn’t want to keep all that data in 
# one giant file that takes longer and longer to process. Fix up 
# that program to keep the running totals in a datafile so the 
# Professor can simply run it on each day’s logs to get the new 
# totals.

use strict;
use warnings;
use Storable;

my %total_bytes;

if (-e 'total_coconet.dat') {
    %total_bytes = %{ retrieve 'total_coconet.dat' };
}

while (<>) {  
    unless (/^#.*/) {
        my ($source, $destination, $bytes) = split;  
        $total_bytes{$source}{$destination} += $bytes; 
        $total_bytes{$source}{'total'} += $bytes;
    }
}

store \%total_bytes, 'total_coconet.dat';

for my $source (sort { $total_bytes{$b}{'total'} <=> $total_bytes{$a}{'total'} } keys %total_bytes) {
    print "$source: $total_bytes{$source}{'total'} total bytes sent\n";

    for my $destination (sort { $total_bytes{$source}{$b}  <=> $total_bytes{$source}{$a} } keys %{ $total_bytes{$source} }) {    
        next if $destination eq 'total';
        print "$source => $destination:",     
        " $total_bytes{$source}{$destination} bytes\n";  
    }  
    print "\n";
}
