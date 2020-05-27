package Sah::Schema::unix::pid;

# DATE
# VERSION

our $schema = [posint => {
    summary => 'Process identifier (PID)',
    description => <<'_',

_

    examples => [
        {value=>-1, valid=>0},
        {value=>0, valid=>0},
        {value=>1, valid=>1},
    ],

}, {}];

1;
# ABSTRACT:
