package Data::Sah::Coerce::perl::To_str::From_int::convert_uid_to_unix_user;

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
        summary => 'Convert UID into Unix username, fail when username does not exist',
        prio => 40,
        might_fail => 1,
    };
}

sub coerce {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{expr_match} = "$dt =~ /\\A[0-9]+\\z/";
    $res->{expr_coerce} = join(
        "",
        "do { my \$tmp = $dt; my \@pw = getpwuid(\$tmp); return [\"UID \$tmp has no associated username\", undef] unless \@pw; [undef, \$pw[0]] }",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|coerce)$

=head1 SEE ALSO

L<Data::Sah::Coerce::perl::To_str::From_int::try_convert_uid_to_unix_user> which
leaves UID as-is when associated username cannot be found.

L<Data::Sah::Coerce::perl::To_str::From_int::convert_gid_to_unix_group>
