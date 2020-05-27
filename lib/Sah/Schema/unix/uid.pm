package Sah::Schema::unix::uid;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [uint => {
    summary => 'User identifier (UID)',
    description => <<'_',

_

    examples => [
        {value=>-1, valid=>0},
        {value=>0, valid=>1},
        {value=>1, valid=>1},
    ],

}, {}];

1;
# ABSTRACT:
