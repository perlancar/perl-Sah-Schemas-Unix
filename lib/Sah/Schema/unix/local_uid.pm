package Sah::Schema::unix::local_uid;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = ["unix::uid" => {
    summary => 'User identifier (UID) that has to exist (has associated username) on the system',
    description => <<'_',

Existing means having a user name associated with this UID, i.e. `getpwuid`
returns a record.

Support coercion from an existing user name.

_
    'prefilters' => ['Unix::convert_unix_user_to_uid', 'Unix::check_uid_exists'],
}];

1;
# ABSTRACT:
