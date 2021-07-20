package Sah::Schema::unix::local_groupname;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = ['unix::groupname' => {
    summary => 'Unix group name that must exist on the system',
    description => <<'_',

Support coercion from GID.

_
    'prefilters' => ['Unix::convert_gid_to_unix_group', 'Unix::check_unix_group_exists'],
}];

1;
# ABSTRACT:
