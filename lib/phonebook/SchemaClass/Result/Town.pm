use utf8;
package phonebook::SchemaClass::Result::Town;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

phonebook::SchemaClass::Result::Town

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<town>

=cut

__PACKAGE__->table("town");

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'town_id_seq'

=head2 town

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 code

  data_type: 'varchar'
  is_nullable: 0
  size: 5

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "bigint",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "town_id_seq",
  },
  "town",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "code",
  { data_type => "varchar", is_nullable => 0, size => 5 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-09-27 00:38:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kUfzNuz063NMrKh4LP8n6w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
