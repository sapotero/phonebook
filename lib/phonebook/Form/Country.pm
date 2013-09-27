package phonebook::Form::Country;

use utf8;
use strict;
use warnings;
use HTML::FormHandler::Moose;
 
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Simple';

has_field 'country' => ( type => 'Text', required => 1, label => 'Страна');
has_field 'code'    => ( type => 'Integer', required => 1, label => 'Код' );
has_field 'submit'  => ( widget => 'Submit', label => '', element_attr => { value => 'Сохранить' });

1;