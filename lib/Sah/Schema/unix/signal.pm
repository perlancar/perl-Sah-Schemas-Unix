package Sah::Schema::unix::signal;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = ['str' => {
    'summary' => 'Unix signal name (e.g. TERM or KILL) or number (9 or 15)',
    match => '\A(?:[A-Z]+[0-9]*|[1-9][0-9]*)\z',
    examples => [
        # valid signals found in most Unix systems. included here for tab
        # completion hints.
        qw/HUP INT QUIT ILL ABRT FPE KILL SEGV PIPE ALRM TERM USR1 USR2 CHLD CONT STOP TSTP TTIN TTOU/,
        1..15,

        # other tests
        {data=>'', valid=>0},
    ],
_
}];

1;
# ABSTRACT:
