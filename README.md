# NAME

GitHub::WebHook - Collection of GitHub WebHook handlers

# DESCRIPTION

GitHub::Webhook provides handlers that receive GitHub WebHooks. A Perl module
in the GitHub::WebHook namespace is expected to implement a method named
`call` which is called with the following parameters: 

- payload

    The encoded webhook payload

- event

    The type of [webhook event](https://developer.github.com/webhooks/#events) e.g.
    `pull`

- delivery

    A unique delivery ID

- logger

    A logger object

See [Plack::GitHub::WebHook](https://metacpan.org/pod/Plack::GitHub::WebHook) for an introduction.

# HANDLERS

- [GitHub::WebHook::Run](https://metacpan.org/pod/GitHub::WebHook::Run)
- [GitHub::WebHook::Clone](https://metacpan.org/pod/GitHub::WebHook::Clone)

# COPYRIGHT AND LICENSE

Copyright Jakob Voss, 2015-

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.
