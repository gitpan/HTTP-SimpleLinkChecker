#$Id: 200.t,v 1.3 2002/01/25 08:49:37 comdog Exp $
print "1..1\n";
$test = 1;

use HTTP::SimpleLinkChecker;

my $code = &HTTP::SimpleLinkChecker::check_link(
	'http://www.perl.org');

print $code == 200 ? "ok $test" : "not ok $test";

