package Data::Sah::Filter::perl::Unix::check_unix_group_exists;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

sub meta {
    +{
        v => 1,
        summary => 'Check that Unix group exists on the system',
        might_fail => 1,
    };
}

sub filter {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{expr_filter} = join(
        "",
        "do { my \$tmp = $dt; my \@tmp = getgrnam(\$tmp); if (!\@tmp) { [\"Group '\$tmp' does not exist\", \$tmp] } else { [undef, \$tmp] } }",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|filter)$
