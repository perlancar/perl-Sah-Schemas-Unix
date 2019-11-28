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
    'x.perl.coerce_rules' => ['From_int::ConvertGIDToUnixGroup', 'From_str::CheckUnixGroupExists'],
}, {}];

1;
# ABSTRACT:
