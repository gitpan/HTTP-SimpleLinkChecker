use Test::More tests => 1;

use HTTP::SimpleLinkChecker;

my $code = HTTP::SimpleLinkChecker::check_link(
	'http://www.perl.org');

is( $code, 200, "I can talk to perl.org!" );

