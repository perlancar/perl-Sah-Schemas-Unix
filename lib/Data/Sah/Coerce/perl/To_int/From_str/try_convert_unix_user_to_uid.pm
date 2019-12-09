package Data::Sah::Coerce::perl::To_int::From_str::try_convert_unix_user_to_uid;

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
        summary => 'Try to convert Unix username into UID, leave as-is when cannot convert',
        prio => 40,
    };
}

sub coerce {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{expr_match} = "$dt !~ /\\A[0-9]+\\z/";
    $res->{expr_coerce} = join(
        "",
        "do { my \$tmp = $dt; my \@pw = getpwnam(\$tmp); \@pw ? \$pw[2] : \$tmp }",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|coerce)$

=head1 SEE ALSO

L<Data::Sah::Coerce::perl::To_int::From_str::convert_unix_user_to_uid> which
dies when failing to convert. Most of the time you'd want this rule.

L<Data::Sah::Coerce::perl::To_int::From_str::try_convert_unix_group_to_gid>
