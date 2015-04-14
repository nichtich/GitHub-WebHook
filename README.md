# NAME

GitHub::WebHook - Collection of GitHub WebHook handlers

# SYNOPSIS

Create new webhook handler (or use one of the existing ["MODULES"](#modules)):

    package GitHub::WebHook::Example;
    use parent 'GitHub::WebHook';
    sub call {
        my ($payload, $event, $id, $logger) = @_;
        ...
        $logger->{info}->("processing some $event with $id");
        1; # success
    }

Build a receiver script with [Plack::App::GitHub::WebHook](https://metacpan.org/pod/Plack::App::GitHub::WebHook):

    use Plack::App::GitHub::WebHook;
    Plack::App::GitHub::WebHook->new( hook => 'Example' )->to_app;

# STATUS

[![Build Status](https://travis-ci.org/nichtich/GitHub-WebHook.png)](https://travis-ci.org/nichtich/GitHub-WebHook)
[![Coverage Status](https://coveralls.io/repos/nichtich/GitHub-WebHook/badge.png?branch=master)](https://coveralls.io/r/nichtich/GitHub-WebHook?branch=master)
[![Kwalitee Score](http://cpants.cpanauthors.org/dist/GitHub-WebHook.png)](http://cpants.cpanauthors.org/dist/GitHub-WebHook)

# DESCRIPTION

GitHub::Webhook provides handlers that receive webhooks in [GitHub
WebHooks](http://developer.github.com/webhooks/) format or similar forms.

The module can be used with [Plack::App::GitHub::WebHook](https://metacpan.org/pod/Plack::App::GitHub::WebHook) to create webhook
receiver scripts, but it can also be used independently.

A Perl module in the GitHub::WebHook namespace is expected to implement a
method named `call` which is called with the following parameters: 

- payload

    The encoded webhook payload

- event

    The type of [webhook event](https://developer.github.com/webhooks/#events) e.g.
    `pull`

- id

    A unique delivery ID

- logger

    A logger object as (possibly blessed) HASH reference with properties `debug`,
    `info`, `warn`, `error`, `fatal`, each being a CODE reference to send log
    messages to.

# MODULES

- [GitHub::WebHook::Run](https://metacpan.org/pod/GitHub::WebHook::Run)

    run a subprocess

- [GitHub::WebHook::Clone](https://metacpan.org/pod/GitHub::WebHook::Clone)

    clone/pull from a git repository

# COPYRIGHT AND LICENSE

Copyright Jakob Voss, 2015-

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.
