package phonebook::Form::Town;

use utf8;
use strict;
use warnings;
use HTML::FormHandler::Moose;
 
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Simple';

has_field 'town'    => ( type => 'Text', required => 1, label => 'Город');
has_field 'code'    => ( type => 'Integer', required => 1, label => 'Код' );
has_field 'submit'  => ( widget => 'Submit', label => '', element_attr => { value => 'Сохранить' });

1;