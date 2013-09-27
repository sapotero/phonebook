use strict;
use warnings;
use Test::More;


use Catalyst::Test 'phonebook';
use phonebook::Controller::Country;

ok( request('/country')->is_success, 'Request should succeed' );
done_testing();
