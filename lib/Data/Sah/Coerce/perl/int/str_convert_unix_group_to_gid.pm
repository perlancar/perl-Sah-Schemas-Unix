package Data::Sah::Coerce::perl::int::str_convert_unix_group_to_gid;

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

    $res->{expr_match} = "$dt !~ /\\A[0-9]+\\z/";
    $res->{expr_coerce} = join(
        "",
        "do { my \$tmp = $dt; my \@gr = getgrnam(\$tmp); \@gr ? \$gr[2] : \$tmp }",
    );

    $res;
}

1;
# ABSTRACT: Convert Unix groupname into GID

=for Pod::Coverage ^(meta|coerce)$

=head1 DESCRIPTION

=cut
