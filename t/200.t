#$Id: 200.t 1448 2004-09-08 02:20:42Z comdog $
use Test::More tests => 1;

use HTTP::SimpleLinkChecker;

my $code = &HTTP::SimpleLinkChecker::check_link(
	'http://www.perl.org');

is( $code, 200, "I can talk to perl.org!" );

