package Data::Sah::Filter::perl::Unix::convert_gid_to_unix_group;

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
        summary => 'Convert GID into Unix groupname, fail when groupname does not exist',
        might_fail => 1,
    };
}

sub filter {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{expr_filter} = join(
        "",
        "do { my \$tmp = $dt; if (\$tmp =~ /\\A[0-9]+\\z/) { my \@gr = getgrgid(\$tmp); return [\"GID \$tmp has no associated group name\", \$tmp] unless \@gr; return [undef, \$gr[0]] } [undef, \$tmp] }",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|filter)$

=head1 SEE ALSO

L<Data::Sah::Filter::perl::Unix::try_convert_gid_to_unix_group> which leaves GID
as-is when associated groupname cannot be found.

L<Data::Sah::Filter::perl::Unix::convert_uid_to_unix_user>
