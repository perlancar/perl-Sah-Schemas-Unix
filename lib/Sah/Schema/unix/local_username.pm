package Sah::Schema::unix::local_username;

# DATE
# VERSION

our $schema = ['unix::username' => {
    summary => 'Unix user name that must exist on the system',
    description => <<'_',

Support coercion from UID.

_
    'x.perl.coerce_rules' => ['int_convert_uid_to_unix_user', 'str_check_unix_user_exists'],
}, {}];

1;
# ABSTRACT:
