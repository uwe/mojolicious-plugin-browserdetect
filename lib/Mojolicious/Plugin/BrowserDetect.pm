package Mojolicious::Plugin::BrowserDetect;

# ABSTRACT: HTTP::BrowserDetect integration for Mojolicious

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

=pod

=head1 SYNOPSIS

  # in your App module
  $self->plugin('browser_detect');

  # in your Mojolicious controller
  $self->browser->...

  # e. g. in your root/index action
  if ($self->browser->mobile) {
      return $self->redirect_to('/mobile');
  }

=head1 DESCRIPTION

This Mojolicious plugin integrates L<HTTP::BrowserDetect>.

=head1 SEE ALSO

L<HTTP::BrowserDetect>

=cut

