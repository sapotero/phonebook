package phonebook::Form::Abonent;
use Moose;
use utf8;
use strict;
use warnings;
use HTML::FormHandler::Moose;
 
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Simple';
=head
=cut

has 'Select' => ( is => 'rw' );

has_field 'name'  => ( type => 'Text',    required => 1, label => 'Имя' );
has_field 'phone' => ( type => 'Integer', required => 1, label => 'Телефон' );

has_field 'country' => ( type => 'Select',  label => 'Страна', required => 1,);
has_field 'town'    => ( type => 'Select',  label => 'Город',  required => 1,);

has_field 'submit'  => ( widget => 'Submit', label => '', element_attr => { value => 'Сохранить' });

sub options_country {
   my $self = shift;
   return unless $self->schema;
   my @rows =
      $self->schema->resultset( 'Country' )->search( {}  )->all;
   return [ map { $_->id, $_->country } @rows ];
}

sub options_town {
    my $self = shift;
    return unless $self->schema;
    my @rows = $self->schema->resultset('Town')->search( {} )->all;
    return [ map { $_->id, $_->town } @rows ];
}


1;