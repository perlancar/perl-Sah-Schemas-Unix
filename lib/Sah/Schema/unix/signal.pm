package Sah::Schema::unix::signal;

# DATE
# VERSION

our $schema = ['str' => {
    'summary' => 'Unix signal name (e.g. TERM or KILL) or number (9 or 15)',
    'x.examples' => [qw/HUP INT QUIT ILL ABRT FPE KILL SEGV PIPE ALRM TERM USR1 USR2 CHLD CONT STOP TSTP TTIN TTOU/, 1..15],
_
}, {}];

1;
# ABSTRACT:
