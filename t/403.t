use Test::More tests => 1;

use HTTP::SimpleLinkChecker;

my $code = HTTP::SimpleLinkChecker::check_link(
	'http://www.pair.com/comdog/cgi-bin/403.cgi');

is( $code, 403, "Unauthorized code works" );
