package Data::Sah::Filter::perl::Unix::convert_unix_user_to_uid;

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
        summary => 'Convert Unix username into UID, fail when cannot convert',
        might_fail => 1,
    };
}

sub filter {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{expr_match} = "$dt !~ ";
    $res->{expr_filter} = join(
        "",
        "do { my \$tmp = $dt; if (\$tmp !~ /\\A[0-9]+\\z/) { my \@pw = getpwnam(\$tmp); return [\"Unknown Unix group '\$tmp'\", \$tmp] unless \@pw; return [undef, \$pw[2]] } [undef, \$tmp] }",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|filter)$

=head1 SEE ALSO

L<Data::Sah::Filter::perl::Unix::try_convert_unix_user_to_uid> which
leave string as-is when there is no associated UID for the username.

L<Data::Sah::Filter::perl::Unix::try_convert_unix_group_to_gid>
