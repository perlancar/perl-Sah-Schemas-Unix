package Data::Sah::Filter::perl::Unix::try_convert_unix_group_to_gid;

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
        summary => 'Try to convert Unix groupname into GID, leave as-is when cannot convert',
    };
}

sub filter {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{expr_filter} = join(
        "",
        "do { my \$tmp = $dt; if (\$tmp !~ /\\A[0-9]+\\z/) { my \@gr = getgrnam(\$tmp); return \@gr ? \$gr[2] : \$tmp } \$tmp }",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|filter)$

=head1 SEE ALSO

L<Data::Sah::Filter::perl::Unix::convert_unix_group_to_gid> which dies when
failing to convert. Most of the time you'd want this rule.

L<Data::Sah::Filter::perl::Unix::try_convert_unix_user_to_uid>
