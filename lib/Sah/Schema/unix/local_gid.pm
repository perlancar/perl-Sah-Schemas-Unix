package Sah::Schema::unix::local_gid;

# DATE
# VERSION

our $schema = ["unix::gid" => {
    summary => 'Group identifier (GID) that has to exist on the system',
    description => <<'_',

Existing means having a group name associated with this GID, i.e. `getgrgid`
returns a record.

Support coercion from an existing group name.

_
    'x.perl.coerce_rules' => ['str_convert_unix_group_to_gid', 'int_check_gid_exists'],
}, {}];

1;
# ABSTRACT:
