package Sah::Schema::unix::local_username;

# AUTHOR
# DATE
# DIST
# VERSION

our $schema = ['unix::username' => {
    summary => 'Unix user name that must exist on the system',
    description => <<'_',

Support coercion from UID.

_
    'x.perl.coerce_rules' => ['From_int::convert_uid_to_unix_user', 'From_str::check_unix_user_exists'],
}, {}];

1;
# ABSTRACT:
