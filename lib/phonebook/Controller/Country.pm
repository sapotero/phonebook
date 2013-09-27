package phonebook::Controller::Country;
use Moose;
use namespace::autoclean;
use utf8;
use phonebook::Form::Country;
BEGIN { extends 'Catalyst::Controller'; }

sub countries : Chained('/') PathPart('country') CaptureArgs(0) {
    my ($self, $c) = @_;
    $c->stash->{countries} = $c->model('DB::Country');
}
 
sub list : Chained('countries') Args(0) {
    my ($self, $c) = @_;
    $c->stash->{template} = 'country/index.tt';      
}
 
sub item : Chained('countries') PathPart('') CaptureArgs(1) {
    my ($self, $c, $id) = @_;
 
    $c->error("ID isn't valid!") unless $id =~ /^\d+$/;
    $c->stash->{item} = $c->stash->{countries}->find($id)
        || $c->detach('not_found');
}
 
sub edit : Chained('item') {
    my ($self, $c) = @_;
    $c->forward('save');
}

sub delete : Chained('item') {
    my ($self, $c) = @_;
    my $item = $c->stash->{item}->delete;
    $c->response->redirect($c->uri_for($c->controller('Country')->action_for('list')));
    $c->detach('list');
}
 
sub add : Chained('countries') {
    my ($self, $c) = @_;
    $c->forward('save');
}

sub save : Private {
    my ($self, $c) = @_;
    my $item = $c->stash->{item} || $c->model('DB::country')->new_result({});
    my $form = phonebook::Form::Country->new( item => $item );
 
    $c->stash( form => $form, template => 'country/edit.tt' );
    return unless $form->process( params => $c->req->params  );

    #$c->redirect_to_action('Country', 'edit', [$item->id]);
    $c->response->redirect($c->uri_for($c->controller('Country')->action_for('list')));
    $c->detach('list');
}
 
sub not_found : Local {
    my ($self, $c) = @_;
    $c->response->status(404);
    $c->stash->{error_msg} = "Country not found!";
    $c->detach('list');
}

__PACKAGE__->meta->make_immutable;

1;
