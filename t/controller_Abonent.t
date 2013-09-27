use strict;
use warnings;
use Test::More;


use Catalyst::Test 'phonebook';
use phonebook::Controller::Abonent;

ok( request('/abonent')->is_success, 'Request should succeed' );
done_testing();
