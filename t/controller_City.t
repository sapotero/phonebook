use strict;
use warnings;
use Test::More;


use Catalyst::Test 'phonebook';
use phonebook::Controller::City;

ok( request('/city')->is_success, 'Request should succeed' );
done_testing();
