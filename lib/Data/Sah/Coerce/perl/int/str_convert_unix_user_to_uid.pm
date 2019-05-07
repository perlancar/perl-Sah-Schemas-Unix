package Data::Sah::Coerce::perl::int::str_convert_unix_user_to_uid;

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
        "do { my \$tmp = $dt; my \@pw = getpwnam(\$tmp); \@pw ? \$pw[2] : \$tmp }",
    );

    $res;
}

1;
# ABSTRACT: Convert Unix username into UID

=for Pod::Coverage ^(meta|coerce)$

=head1 DESCRIPTION

=cut
