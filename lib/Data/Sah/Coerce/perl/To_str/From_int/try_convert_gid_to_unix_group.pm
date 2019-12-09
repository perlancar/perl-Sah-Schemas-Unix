package Data::Sah::Coerce::perl::To_str::From_int::try_convert_gid_to_unix_group;

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
        summary => 'Try to convert GID into Unix groupname, leave as-is if cannot convert',
        prio => 40,
    };
}

sub coerce {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{expr_match} = "$dt =~ /\\A[0-9]+\\z/";
    $res->{expr_coerce} = join(
        "",
        "do { my \$tmp = $dt; my \@gr = getgrgid(\$tmp); \@gr ? \$gr[0] : \$tmp }",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|coerce)$

=head1 SEE ALSO

L<Data::Sah::Coerce::perl::To_str::From_int::convert_gid_to_unix_group> which
dies when failing to convert. Most of the time you'd want this rule.

L<Data::Sah::Coerce::perl::To_str::From_int::try_convert_uid_to_unix_user>
