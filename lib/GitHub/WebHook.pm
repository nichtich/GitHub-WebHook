package GitHub::WebHook;
use strict;
use warnings;

our $VERSION = '0.10';

sub call { }

1;
__END__

=head1 NAME

GitHub::WebHook - Collection of GitHub WebHook handlers

=head1 DESCRIPTION

GitHub::Webhook provides handlers that receive GitHub WebHooks. A Perl module
in the GitHub::WebHook namespace is expected to implement a method named
C<call> which is called with the following parameters: 

=over

=item payload

The encoded webhook payload

=item event

The type of L<webhook event|https://developer.github.com/webhooks/#events> e.g.
C<pull>

=item delivery

A unique delivery ID

=item logger

A logger object

=back

See L<Plack::App::GitHub::WebHook> for an introduction.

=head1 HANDLERS

=over

=item

L<GitHub::WebHook::Run>

=item

L<GitHub::WebHook::Clone>

=back

=head1 COPYRIGHT AND LICENSE

Copyright Jakob Voss, 2015-

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut
