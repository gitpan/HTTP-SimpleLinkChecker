print "1..1\n";
$test = 1;

use HTTP::SimpleLinkChecker;

my $code = &HTTP::SimpleLinkChecker::check_link(
	'http://www.smithrenaud.com/robots.txt');

print $code == 200 ? "ok $test" : "not ok $test";

