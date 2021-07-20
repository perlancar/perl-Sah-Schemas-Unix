package Sah::Schema::unix::local_username;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = ['unix::username' => {
    summary => 'Unix user name that must exist on the system',
    description => <<'_',

Support coercion from UID.

_
    'prefilters' => ['Unix::convert_uid_to_unix_user', 'Unix::check_unix_user_exists'],
}];

1;
# ABSTRACT:
