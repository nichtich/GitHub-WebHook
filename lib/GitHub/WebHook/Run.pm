package GitHub::WebHook::Run;
use strict;
use warnings;
use v5.10;

use IPC::Run3;
use Scalar::Util qw(reftype);
use Carp;

our $VERSION = '0.10';

sub new {
    my ($class, %config) = @_;

    my $cmd = $config{cmd};
    if ( (reftype $cmd || '') !~ /^(CODE|ARRAY)$/ ) {
        croak 'expecting cmd as ARRAY or CODE referenc';
    }

    bless {
        cmd   => reftype $cmd eq 'ARRAY' ? sub { $config{cmd} } : $cmd,
        chdir => $config{chdir},
    }, $class;
}

sub run {
    my ($self, $cmd, $logger) = @_;

    if (@$cmd) {
        $logger->info('$ '.join ' ', @$cmd);
        run3 $cmd, undef, $logger->{debug}, $logger->{warn};
    }
}

sub call {
    my $self   = shift;
    my $logger = $_[3];

    if (defined $self->{chdir}) {
        my $dir = $self->{chdir};
        $logger->info('$ chdir '.$dir);
        chdir $dir;
    }

    $self->run( $self->{cmd}->(@_), $logger );
    1;
}

1;
__END__

=head1 NAME

GitHub::WebHook::Run - Run a subprocess on GitHub WebHook reception

=head1 SYNOPSIS

    use Plack::App::GitHub::WebHook;
    
    Plack::App::GitHub::WebHook->new(
        hook => GitHub::WebHook::Run->new(
            chdir => $my_directory,
            cmd   => ['make','install']
        )
    )->to_app;

=head1 DESCRIPTION

This module can be used to call a command on reception of a GitHub WebHook with
L<Plack::App::GitHub::WebHook>. The command is logged with log level C<info>
and its output with STDOUT on log level C<debug> and STDERR on log level
C<error>. The command's exit code is ignored.

=head1 CONFIGURATION

=over

=item cmd

The command to execute, given as array reference or as code reference to return
an array reference given payload, event, delivery and logger (as usual to all
hooks). Empty array references are ignored.

=item chdir

A directory to change into before command execution

=back

=head1 SEE ALSO

L<IPC::Run3>

=head1 COPYRIGHT AND LICENSE

Copyright Jakob Voss, 2015-

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut
