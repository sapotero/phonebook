package phonebook::Controller::City;
use Moose;
use namespace::autoclean;
use utf8;
use phonebook::Form::Town;
BEGIN { extends 'Catalyst::Controller'; }

sub towns : Chained('/') PathPart('city') CaptureArgs(0) {
    my ($self, $c) = @_;
    $c->stash->{towns} = $c->model('DB::Town');
}
 
sub list : Chained('towns') Args(0) {
    my ($self, $c) = @_;
    $c->stash->{template} = 'town/index.tt';
}
 
sub item : Chained('towns') PathPart('') CaptureArgs(1) {
    my ($self, $c, $id) = @_;
 
    $c->error("ID isn't valid!") unless $id =~ /^\d+$/;
    $c->stash->{item} = $c->stash->{towns}->find($id)
        || $c->detach('not_found');
}
 
sub edit : Chained('item') {
    my ($self, $c) = @_;
    $c->forward('save');
}

sub delete : Chained('item') {
    my ($self, $c) = @_;
    my $item = $c->stash->{item}->delete;
    $c->response->redirect($c->uri_for($c->controller('City')->action_for('list')));
    $c->detach('list');
}
 
sub add : Chained('towns') {
    my ($self, $c) = @_;
    $c->forward('save');
}

sub save : Private {
    my ($self, $c) = @_;
    my $item = $c->stash->{item} || $c->model('DB::Town')->new_result({});
    my $form = phonebook::Form::Town->new( item => $item );
 
    $c->stash( form => $form, template => 'town/edit.tt' );
    return unless $form->process( params => $c->req->params  );

    #$c->redirect_to_action('town', 'edit', [$item->id]);
    $c->response->redirect($c->uri_for($c->controller('City')->action_for('list')));
    $c->detach('list');
}
 
sub not_found : Local {
    my ($self, $c) = @_;
    $c->response->status(404);
    $c->stash->{error_msg} = "City not found!";
    $c->detach('list');
}

__PACKAGE__->meta->make_immutable;

1;
