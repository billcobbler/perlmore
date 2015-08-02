#!/usr/bin/perl
#
#   Write a program that prints the date and the day of the week, but allow the user to
#   choose to send the output either to a file, a scalar, or both at the same time. No matter
#   which output channels the user selects, send the output with a single print statement.
#   If the user chooses to send the output to a scalar, at the end of the program
#   print the scalar’s value to standard output.

use IO::Tee;
use DateTime;
use Getopt::Long;

my %options;
my $string = '';
my $dt = DateTime->now();
my @outputs;

GetOptions (    \%options,
                'log=s',
                'scalar',
           );

if (defined($options{log})) {
    open my $log_fh, '>>', $options{log}
        or die "Could not open $options{log}";
    push @outputs, $log_fh;
}
if ($options{scalar}) {
    open my $scalar_fh, '>>', \$string;
    push @outputs, $scalar_fh;
}

$tee_fh = IO::Tee->new( @outputs );
print $tee_fh "Today is " . $dt->day_name . ", " .  $dt->ymd('/') . "\n";

if ( $string ne '' ) {
    print "$string";
}

