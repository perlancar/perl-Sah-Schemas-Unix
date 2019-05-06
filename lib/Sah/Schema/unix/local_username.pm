package Sah::Schema::unix::local_username;

# DATE
# VERSION

our $schema = ['unix::username' => {
    summary => 'Unix user name that must exist on the system',
    'x.perl.coerce_rules' => ['str_check_unix_user_exists'],
}, {}];

1;
# ABSTRACT:
