package phonebook::Controller::Root;
use Moose;
use namespace::autoclean;
use utf8;
BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config( namespace => '', encoding => 'UTF-8' );

=head1 NAME

phonebook::Controller::Root - Root Controller for phonebook

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)
my $content = $c->model('DB::town')->search(
        {},
        { 
          join => 'country' ,  
          prefetch => 'country',
          rows     => 10
        },
    );
=cut

sub index : PathPart('/') : Args(0) {
    my ( $self, $c ) = @_;

    my $country = $c->model('DB::country')->search( {} );
    my $town    = $c->model('DB::town')->search(    {} );
    my $abonent = $c->model('DB::abonent')
        ->search( {}, { join => ( 'town', 'country', ) }, );

    $c->stash(
        template => 'index.tt',
        country  => $country,
        town     => $town,
        abonent  => $abonent
    );
    $c->forward( $c->view('HTML') );
}

sub list : Chained('index') : Args(0) {
    my ( $self, $c ) = @_;
    $c->stash->{template} = 'index.tt';
}

sub default : Path {
    my ( $self, $c ) = @_;
    $c->response->body('Page not found');
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut


=head1 AUTHOR

sapotero,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;

