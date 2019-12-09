package Data::Sah::Coerce::perl::To_int::From_str::convert_unix_group_to_gid;

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
        summary => 'Convert Unix groupname into GID, fail when cannot convert',
        prio => 40,
        might_fail => 1,
    };
}

sub coerce {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{expr_match} = "$dt !~ /\\A[0-9]+\\z/";
    $res->{expr_coerce} = join(
        "",
        "do { my \$tmp = $dt; my \@gr = getgrnam(\$tmp); return [\"Unknown Unix user '\$tmp'\"] unless \@gr ? [undef, \$gr[2]] }",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|coerce)$

=head1 SEE ALSO

L<Data::Sah::Coerce::perl::To_int::From_str::try_convert_unix_group_to_gid>
which leave string as-is when there is no associated GID for the groupname.

L<Data::Sah::Coerce::perl::To_int::From_str::try_convert_unix_user_to_uid>