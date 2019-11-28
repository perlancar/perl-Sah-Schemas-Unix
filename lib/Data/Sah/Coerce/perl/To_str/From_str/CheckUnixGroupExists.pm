package Data::Sah::Coerce::perl::To_str::From_str::CheckUnixGroupExists;

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
        summary => 'Check that Unix group exists on the system',
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
# ABSTRACT:

=for Pod::Coverage ^(meta|coerce)$
