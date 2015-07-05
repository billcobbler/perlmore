#!/usr/bin/perl
# The Professor’s datafile (mentioned earlier in this chapter) is available 
# as coconet.dat in the files you can download from the O’Reilly web site. 
# There may be comment lines (beginning with a pound sign); be sure to skip 
# them. (That is, your program should skip them. You might find a helpful 
# hint if you read them!) Modify the code from this chapter so that each 
# source machine’s portion of the output shows the total number of bytes 
# from that machine. List the source machines in order from most to least 
# data transferred. Within each group, list the destination machines in 
# order from most to least data transferred to that target from the source 
# machine. The result should be that the machine that sent the most data 
# will be the first source machine in the list, and the first destination 
# should be the machine to which it sent the most data. The Professor can 
# use this printout to reconfigure the network for efficiency.

use strict;
use warnings;

