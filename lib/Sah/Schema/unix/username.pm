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
        {value=>'-andy', valid=>0},
        {value=>'1234', valid=>0},
        {value=>'andy2', valid=>1},
        {value=>'an dy', valid=>0},
        {value=>'an.dy', valid=>1},
        {value=>'a' x 33, value=>0, summary=>'Too long'},
    ],

}, {}];

1;
# ABSTRACT:
