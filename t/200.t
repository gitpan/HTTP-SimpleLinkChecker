#$Id: 200.t,v 1.4 2004/09/08 02:20:42 comdog Exp $
use Test::More tests => 1;

use HTTP::SimpleLinkChecker;

my $code = &HTTP::SimpleLinkChecker::check_link(
	'http://www.perl.org');

is( $code, 200, "I can talk to perl.org!" );

