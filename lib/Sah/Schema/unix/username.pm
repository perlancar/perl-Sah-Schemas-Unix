package Sah::Schema::unix::username;

# DATE
# VERSION

our $schema = [str => {
    summary => 'Unix account name',
    description => <<'_',

The checking follows POSIX rules: does not begin with a hyphen and only contains
[A-Za-z0-9._-].

The above rule allows integers like 1234, which can be confused with UID, so
this schema disallows pure integers.

The maximum length is 32 following libc6's limit.

_
    min_len => 1,
    max_len => 32,
    match => qr/(?=\A[A-Za-z0-9._][A-Za-z0-9._-]{0,31}\z)(?=.*[A-Za-z._-])/,

    examples => [
        {value=>'', valid=>0},
        {value=>'foo', valid=>1},
    ],

}, {}];

1;
# ABSTRACT:
