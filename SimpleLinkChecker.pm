#$Id: SimpleLinkChecker.pm,v 1.8 2005/03/12 05:23:57 comdog Exp $
package HTTP::SimpleLinkChecker;
use strict;

use vars qw($ERROR $VERSION @EXPORT_OK);

use HTTP::Request;
use LWP::UserAgent;

@EXPORT_OK = qw(check_link);

my $UA = LWP::UserAgent->new();
$UA->env_proxy;

$VERSION = sprintf "%d.%02d", q$Revision: 1.8 $ =~ m/ (\d+) \. (\d+)/x;

sub check_link
	{
	my $link = shift;
	unless( defined $link )
		{
		$ERROR = 'Received no argument';
		return;
		}

	my $request = HTTP::Request->new('HEAD', $link);
	unless( ref $request )
		{
		$ERROR = 'Could not create HEAD request';
		return;
		}

	my $response = $UA->request($request);

	if( ref $response and $response->code >= 400 )
		{
		$request = HTTP::Request->new('GET', $link);
		unless( ref $request )
			{
			$ERROR = 'Could not create GET request';
			return;
			}
		$response = $UA->request($request);
		}

	unless( ref $response )
		{
		$ERROR = 'Could not get response';
		return;
		}

	return $response->code;
	}

sub user_agent
	{
	return $UA;
	}

1;

=head1 NAME

HTTP::SimpleLinkChecker - Check the HTTP response code for a link

=head1 SYNOPSIS

	use HTTP::SimpleLinkChecker;

	my $code = HTTP::SimpleLinkChecker::check_link($url);

	unless( defined $code )
		{
		print "Error: $HTTP::SimpleLinkChecker::ERROR\n";
		}

=head1 DESCRIPTION

You don't have to know anything about objected-oriented
Perl, LWP, or the HTTP module to be able to check your
links. This module is designed for the casual user. It has
one function, C<check_link>, that returns the HTTP response
code that it receives when it tries to fetch the web address
passed to it. The undef value is returned for any non-HTTP failure
and the C<$HTTP::SimpleLinkChecker::ERROR> variable is
set.

The HEAD method is tried first, although if anything other than
a good status code (those less than 400) is received, another
request is made with the GET method.

If you are behind a firewall or proxy, this module picks up those
settings through LWP::UserAgent's env_proxy() method.  See
L<LWP::UserAgent> for more details.

=head2 Functions

=over 4

=item check_link( URL )

Return the HTTP response code for URL.

=item user_agent

Returns a reference to the LWP::UserAgent object.  You
can affect it directly.  See L<LWP::UserAgent>.

	my $ua = HTTP::SimpleLinkChecker::user_agent;
	$ua->from( 'joe@example.com' );
	$ua->agent( 'Mozilla 19.2' );

=back

=head1 SOURCE AVAILABILITY

This source is part of a SourceForge project which always has the
latest sources in CVS, as well as all of the previous releases.

	http://sourceforge.net/projects/brian-d-foy/

If, for some reason, I disappear from the world, one of the other
members of the project can shepherd this module appropriately.

=head1 AUTHOR

brian d foy, C<< <bdfoy@cpan.org> >>

=head1 COPYRIGHT

Copyright (c) 2004-2005 brian d foy.  All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
