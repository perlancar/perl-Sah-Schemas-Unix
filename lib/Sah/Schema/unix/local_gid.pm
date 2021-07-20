package Sah::Schema::unix::local_gid;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = ["unix::gid" => {
    summary => 'Group identifier (GID) that has to exist on the system',
    description => <<'_',

Existing means having a group name associated with this GID, i.e. `getgrgid`
returns a record.

Support coercion from an existing group name.

_
    'prefilters' => ['Unix::convert_unix_group_to_gid', 'Unix::check_gid_exists'],
}];

1;
# ABSTRACT:
