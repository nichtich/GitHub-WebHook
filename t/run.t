use strict;
use warnings;
use Test::More;
use GitHub::WebHook::Run;
use Plack::App::GitHub::WebHook; #::Logger;

for (undef, 1, {}) {
    eval { GitHub::WebHook::Run->new( cmd => $_ ) };
    ok $@, "validate cmd";
}

my $run = GitHub::WebHook::Run->new( 
    cmd => sub {
        my $payload = shift;
        [ $^X, '-e', "print \"$payload\\n\"" ]
    }
);

my @log;
my $logger = Plack::App::GitHub::WebHook::Logger->new( sub {
    push @log, $_[0]->{level}, $_[0]->{message};
});

ok $run->call(42,0,0,$logger), 'called';

is_deeply \@log, [
    info => '$ '.$^X.' -e print "42\n"',
    info => 42
], 'executed and logged';

done_testing;
