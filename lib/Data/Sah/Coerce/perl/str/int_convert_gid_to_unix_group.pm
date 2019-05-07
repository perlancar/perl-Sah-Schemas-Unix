package Data::Sah::Coerce::perl::str::int_convert_gid_to_unix_group;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

sub meta {
    +{
        v => 4,
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
# ABSTRACT: Convert GID into Unix groupname

=for Pod::Coverage ^(meta|coerce)$

=head1 DESCRIPTION

=cut
