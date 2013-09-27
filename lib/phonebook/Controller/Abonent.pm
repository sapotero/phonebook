package phonebook::Controller::Abonent;
use Moose;
use namespace::autoclean;
use phonebook::Form::Abonent;
use utf8;


BEGIN { extends 'Catalyst::Controller'; }

sub abonents : Chained('/') PathPart('abonent') CaptureArgs(0) {
    my ($self, $c) = @_;
    $c->stash->{abonents} = $c->model('DB::Abonent');
}
 
sub list : Chained('abonents') Args(0) {
    my ($self, $c) = @_;
    $c->stash->{template} = 'abonent/index.tt';      
}
 
sub item : Chained('abonents') PathPart('') CaptureArgs(1) {
    my ($self, $c, $id) = @_;
 
    $c->error("ID isn't valid!") unless $id =~ /^\d+$/;
    $c->stash->{item} = $c->stash->{abonents}->find($id)
        || $c->detach('not_found');
}
 
sub edit : Chained('item') {
    my ($self, $c) = @_;
    $c->forward('save');
}

sub delete : Chained('item') {
    my ($self, $c) = @_;
    my $item = $c->stash->{item}->delete;
    $c->response->redirect($c->uri_for($c->controller('Abonent')->action_for('list')));
    $c->detach('list');
}
 
sub add : Chained('abonents') {
    my ($self, $c) = @_;
    $c->forward('save');
}

sub save : Private {
    my ($self, $c) = @_;
    my $item = $c->stash->{item} || $c->model('DB::Abonent')->new_result({});
    my $form = phonebook::Form::Abonent->new( item => $item, schema => $c->model('DB')->schema );
 
    $c->stash( form => $form, template => 'abonent/edit.tt' );
    return unless $form->process( params => $c->req->params  );

    $c->response->redirect($c->uri_for($c->controller('Abonent')->action_for('list')));
    $c->detach('list');
}
 
sub not_found : Local {
    my ($self, $c) = @_;
    $c->response->status(404);
    $c->stash->{error_msg} = "Abonent not found!";
    $c->detach('list');
}

__PACKAGE__->meta->make_immutable;

1;
