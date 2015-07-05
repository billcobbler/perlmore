#!/usr/bin/perl
# Using the final version of check_required_items, write a subroutine 
# check_items_for_ all that takes a hash reference as its only parameter, 
# pointing at a hash whose keys are the people aboard the Minnow and 
# whose corresponding values are array references of the things they 
# intend to bring onboard. For example, the hash reference might be 
# constructed like so:
#
#    my @gilligan  = ... gilligan items ...; 
#    my @skipper   = ... skipper items ...; 
#    my @professor = ... professor items ...; 
#    my %all = (  
#       Gilligan  => \@gilligan,  
#       Skipper   => \@skipper,  
#       Professor => \@professor, 
#    ); 
#    check_items_for_all(\%all); 
#
# The newly constructed subroutine should call check_required_items for 
# each person in the hash, updating their provisions list to include the 
# required items.

