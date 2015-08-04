#!/usr/bin/perl
#   Modifythe recursive directory dumping routine so it shows the nested directories
#   through indentation. An empty directory should show up as:
#
#   sandbar, an empty directory
#
#   while a nonempty directory should appear with nested contents, indented two
#   spaces:
#
#   uss_minnow, with contents:
#     anchor
#     broken_radio
#     galley, with contents:
#        captain_crunch_cereal
#        gallon_of_milk
#        tuna_fish_sandwich
#     life_preservers

my $dir = $ARGV[0];

dump_data_for_path($dir, data_for_path($dir));

sub data_for_path {
    my $path = shift;
    
    if (-f $path or -l $path) {     #file or symbolic link
        return undef;
    }

    if (-d $path) {
        my %directory;
        opendir PATH, $path or die "Cannot opendir $path: $!";
        my @names = readdir PATH;
        closedir PATH;
        for my $name (@names) {
            next if $name eq '.' or $name eq '..';
            $directory{$name} = data_for_path("$path/$name");
        }
        return \%directory;
    }
    warn "$path is neither a file nor a directory\n";
    return undef;
}

sub dump_data_for_path {        
    my $path = shift;
    my $data = shift;
    my $prefix = shift || "";
    
    print "$prefix$path";
    
    if (not defined $data) { # plain file
        print "\n";
        return;
    }
    
    my %directory = %$data;
    
    if (%directory) {
        print ", with contents of:\n";
        for (sort keys %directory) {
            dump_data_for_path("$path/$_", $directory{$_}, "$prefix  ");
        } 
    } else {
        print ", an empty directory\n";
    }
}

