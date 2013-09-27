package phonebook::View::HTML;
use Moose;
use namespace::autoclean;
use utf8;
extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die         => 1,
    ENCODING           => 'utf8',

        # WRAPPER            => 'wrapper.tt',
        # ERROR              => 'error.tt',
);


=head1 NAME

phonebook::View::HTML - TT View for phonebook

=head1 DESCRIPTION

TT View for phonebook.

=head1 SEE ALSO

L<phonebook>

=head1 AUTHOR

sapotero,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
