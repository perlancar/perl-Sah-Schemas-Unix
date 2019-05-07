package Sah::Schema::unix::local_gid;

# DATE
# VERSION

our $schema = ["unix::gid" => {
    summary => 'Group identifier (GID) that has to exist (has associated group name) on the system',
    description => <<'_',

_
    'x.perl.coerce_rules' => ['str_convert_unix_group_to_gid', 'int_check_gid_exists'],
}, {}];

1;
# ABSTRACT:
