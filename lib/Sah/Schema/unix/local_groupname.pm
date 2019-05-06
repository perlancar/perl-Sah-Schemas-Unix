package Sah::Schema::unix::local_groupname;

# DATE
# VERSION

our $schema = ['unix::groupname' => {
    summary => 'Unix group name that must exist on the system',
    'x.perl.coerce_rules' => ['str_check_unix_group_exists'],
}, {}];

1;
# ABSTRACT:
