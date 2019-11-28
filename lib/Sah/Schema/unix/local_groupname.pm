package Sah::Schema::unix::local_groupname;

# AUTHOR
# DATE
# DIST
# VERSION

our $schema = ['unix::groupname' => {
    summary => 'Unix group name that must exist on the system',
    description => <<'_',

Support coercion from GID.

_
    'x.perl.coerce_rules' => ['From_int::convert_gid_to_unix_group', 'From_str::check_unix_group_exists'],
}, {}];

1;
# ABSTRACT:
