#!/usr/bin/perl
# Write a program that asks the user to enter a pattern (regular expression). 
# Read this as data from the keyboard; don’t get it from the command-line
# arguments. Report a list of files in some hardcoded directory (such as 
# "/etc" or 'C:\\Windows') whose names match the pattern. Repeat this until 
# the user enters an empty string instead of a pattern. The user should not 
# type the forward slashes that are traditionally used to delimit pattern 
# matches in Perl; the input pattern is delimited by the trailing newline. 
# Ensure that a faulty pattern, such as one with unbalanced parentheses, 
# doesn’t crash the program.

use warnings;
use strict;

print "Enter a regex pattern: ";

while (my $pat = <>){
    chomp $pat;
    last if $pat eq '';

    die unless opendir DIR, "./ex2files/";
    eval {
        foreach my $file  (grep $_ =~ $pat, readdir DIR) {
            print "$file\n";
        }
    };
    closedir DIR;

    print "Enter another regex pattern: ";
}
