package Sah::Schema::unix::local_uid;

# DATE
# VERSION

our $schema = [uint => {
    summary => 'User identifier (UID) that has to exist (has associated username) on the system',
    description => <<'_',

_
    'x.perl.coerce_rules' => ['int_check_uid_exists'],
}, {}];

1;
# ABSTRACT:
