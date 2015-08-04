#!/usr/bin/perl
#   Read up on the Benchmark module, included with Perl. Write a program that will
#   answer the question “How much does using the Schwartzian Transform speed up
#   the task of Exercise 1?”
use strict;
use warnings;
use Benchmark qw(:all);

my $result;
my @contents = glob "/bin/*";

$result = timethese (-5, {
        'Naive Approach'    => sub { 
                                        my @sorted = sort { -s $a <=> -s $b } @contents; 
                                    },
        'Schwartzian'       => sub {
                                        my @sorted =
                                        map $_->[0],
                                        sort { $b->[1] <=> $a->[1] }
                                        map [$_, -s $_],
                                        @contents;
                                    },
});

cmpthese($result);
