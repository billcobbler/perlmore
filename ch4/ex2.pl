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

my %all = (  
   Gilligan  => [qw/red_shirt hat lucky_socks water_bottle/],  
   Skipper   => [qw/blue_shirt hat jacket preserver sunscreen/],  
   Professor => [qw/sunscreen water_bottle slide_rule batteries radio/], 
); 
check_items_for_all(\%all); 

sub check_required_items {  
    my $who   = shift;  
    my $items = shift;
    my @required = qw(preserver sunscreen water_bottle jacket);  
    my @missing = (  );
    local $" = ', ';    

    for my $item (@required) {    
        unless (grep $item eq $_, @$items) { # not found in list?      
            print "$who is missing $item.\n";      
            push @missing, $item;    
        }  
    }  
    
    if (@missing) {    
        print "Adding @missing to @$items for $who.\n";    
        push @$items, @missing;  
    } 
}

sub check_items_for_all {
    my $people = shift;
    check_required_items($_, $people->{$_}) for keys %$people;
}
