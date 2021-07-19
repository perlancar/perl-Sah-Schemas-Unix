package Sah::Schema::unix::signal;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = ['str' => {
    'summary' => 'Unix signal name (e.g. TERM or KILL) or number (9 or 15)',
    match => '\A(?:[A-Z]+[0-9]*|[1-9][0-9]*)\z',
    examples => [
        {data=>'', valid=>0},
        {data=>'HUP', valid=>1},
        {data=>'1', valid=>1},
    ],
_
}, {}];

1;
# ABSTRACT:
