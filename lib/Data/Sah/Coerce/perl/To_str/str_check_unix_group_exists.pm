package Data::Sah::Coerce::perl::str::str_check_unix_group_exists;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

sub meta {
    +{
        v => 4,
        prio => 50,
        might_fail => 1,
    };
}

sub coerce {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{expr_match} = "1";
    $res->{expr_coerce} = join(
        "",
        "do { my \$tmp = $dt; my \@tmp = getgrnam(\$tmp); if (!\@tmp) { [\"Group '\$tmp' does not exist\"] } else { [undef, \$tmp] } }",
    );

    $res;
}

1;
# ABSTRACT: Check that Unix group exists on the system

=for Pod::Coverage ^(meta|coerce)$

=head1 DESCRIPTION

=cut
