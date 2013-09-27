use strict;
use warnings;

use phonebook;

my $app = phonebook->apply_default_middlewares(phonebook->psgi_app);
$app;

