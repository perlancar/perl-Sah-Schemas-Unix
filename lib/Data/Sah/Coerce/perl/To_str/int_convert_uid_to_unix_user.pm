package Data::Sah::Coerce::perl::str::int_convert_uid_to_unix_user;

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
        "do { my \$tmp = $dt; my \@pw = getpwuid(\$tmp); \@pw ? \$pw[0] : \$tmp }",
    );

    $res;
}

1;
# ABSTRACT: Convert UID into Unix username

=for Pod::Coverage ^(meta|coerce)$

=head1 DESCRIPTION

=cut
