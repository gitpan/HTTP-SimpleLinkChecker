#$Id: 403.t 1448 2004-09-08 02:20:42Z comdog $

use Test::More tests => 2;

use HTTP::SimpleLinkChecker;

# this won't work for robots
my $code = &HTTP::SimpleLinkChecker::check_link(
	'http://groups.google.com/groups?as_uauthors=comdog@panix.com');

is( $code, 403, "Unauthorized code works" );

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
my $ua = &HTTP::SimpleLinkChecker::user_agent;
$ua->agent( "Mozilla/4.0 (compatible; MSIE 5.0; Mac_PowerPC)" );

$code = &HTTP::SimpleLinkChecker::check_link(
	'http://groups.google.com/groups?as_uauthors=comdog@panix.com');

is( $code, 200, "OK code works" );


