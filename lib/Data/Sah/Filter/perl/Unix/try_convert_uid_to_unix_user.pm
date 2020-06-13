package Data::Sah::Filter::perl::Unix::try_convert_uid_to_unix_user;

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
        summary => 'Try to convert UID into Unix username, leave as-is if cannot convert',
    };
}

sub filter {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{expr_filter} = join(
        "",
        "do { my \$tmp = $dt; if (\$tmp =~ /\\A[0-9]+\\z/) { my \@pw = getpwuid(\$tmp); \@pw ? \$pw[0] : \$tmp } else { \$tmp } }",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|filter)$

=head1 SEE ALSO

L<Data::Sah::Filter::perl::Unix::convert_uid_to_unix_user> which dies when
failing to convert. Most of the time you'd want this rule.

L<Data::Sah::Filter::perl::Unix::try_convert_gid_to_unix_group>
