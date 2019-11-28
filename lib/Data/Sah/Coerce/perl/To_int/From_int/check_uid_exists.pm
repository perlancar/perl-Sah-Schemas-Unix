package Data::Sah::Coerce::perl::To_int::From_int::check_uid_exists;

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
        summary => 'Check that UID exists (has associated username) on the system',
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
        "do { my \$tmp = $dt+0; my \@tmp = getpwuid(\$tmp); if (!\@tmp) { [\"UID \$tmp is not associated with any user\"] } else { [undef, \$tmp] } }",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|coerce)$
