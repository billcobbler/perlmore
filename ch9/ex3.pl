#!/usr/bin/perl
#
#   Using a Schwartzian Transform, read a list of words, and sort them in “dictionary
#   order.” Dictionaryorder ignores all capitalization and internal punctuation. Hint: the
#   following transformation might be useful:
#
#       my $string = 'Mary-Ann';
#       $string =~ tr/A-Z/a-z/; # force all lowercase
#       $string =~ tr/a-z//cd; # strip all but a-z from the string
#       print $string; # prints "maryann"
#
#   Be sure you don’t mangle the data! If the input includes the Professor and the
#   skipper, the output should have them listed in that order, with that capitalization.
