#!/usr/bin/perl
#
#   Using the glob operator, a naive sort of everyname in the /bin directorybytheir relative
#   sizes might be written as:
#   my @sorted = sort { -s $a <=> -s $b } glob "/bin/*";
#
#   Rewrite this using the Schwartzian Transform technique.
#
#   If you don’t have many files in the /bin directory, perhaps because you don’t have a
#   Unix machine, change the argument to glob as needed.


