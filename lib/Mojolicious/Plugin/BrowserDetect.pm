package Mojolicious::Plugin::BrowserDetect;

use base 'Mojolicious::Plugin';

use HTTP::BrowserDetect;


sub register {
    my ($self, $app, $conf) = @_;

    my $browser;
    $app->hook(
        before_dispatch => sub {
            my ($c) = @_;
            $browser = HTTP::BrowserDetect->new(
                $c->req->headers->user_agent,
            );
        },
    );

    $app->helper(browser => sub { $browser });
}


1;

