package Sah::Schema::unix::gid;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [uint => {
    summary => 'Group identifier (GID)',
    description => <<'_',

_

    examples => [
        {value=>-1, valid=>0},
        {value=>0, valid=>1},
        {value=>1, valid=>1},
    ],

}];

1;
# ABSTRACT:
