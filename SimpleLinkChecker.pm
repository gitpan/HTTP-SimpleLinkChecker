package HTTP::SimpleLinkChecker;
use strict;

use vars qw($UA $ERROR $VERSION @EXPORT_OK);

use HTTP::Request;
use LWP::UserAgent;

@EXPORT_OK = qw(check_link);

$UA = LWP::UserAgent->new();

$VERSION = 0.51;

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

1;

# Below is the stub of documentation for your module. You better edit it!

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
passed to it. The undef value is returned for any failure
and the C<$HTTP::SimpleLinkChecker::ERROR> variable is
set.

The HEAD method is tried first, although if anything other than
a good status code (those less than 400) is received, another
request is made with the GET method.

=head1 AUTHOR

brian d foy <comdog@panix.com>

=cut
