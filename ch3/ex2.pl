#!/usr/bin/perl
# Parse the International Standard Book Number from the back of this 
# book (0596102062). Install the Business::ISBN module from CPAN and 
# use it to extract the country code and the publisher code from the 
# number.

use strict;
use warnings;

use Business::ISBN;

my $isbn = Business::ISBN->new($ARGV[0]);
print "ISBN: " . $isbn->as_string . "\n";
# Country code doesn't work in Business::ISBN, so we list group code instead.
# print "Country Code: " . $isbn->country_code . "\n";
print "Group Code: " . $isbn->group_code . "\n";
print "Publisher Code: " . $isbn->publisher_code . "\n";
