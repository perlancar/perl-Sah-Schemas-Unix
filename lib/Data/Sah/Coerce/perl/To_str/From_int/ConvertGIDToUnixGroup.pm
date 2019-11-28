package Data::Sah::Coerce::perl::To_str::From_int::ConvertGIDToUnixGroup;

# AUTHOR
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

sub meta {
    +{
        v => 4,
        summary => 'Convert GID into Unix groupname',
        prio => 40,
    };
}

sub coerce {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{expr_match} = "$dt =~ /\\A[0-9]+\\z/";
    $res->{expr_coerce} = join(
        "",
        "do { my \$tmp = $dt; my \@gr = getgrgid(\$tmp); \@gr ? \$gr[0] : \$tmp }",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|coerce)$
