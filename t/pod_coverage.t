# $Id: pod_coverage.t 1620 2005-03-12 05:23:57Z comdog $

use Test::More;
eval "use Test::Pod::Coverage";

if( $@ )
	{
	plan skip_all => "Test::Pod::Coverage required for testing POD";
	}
else
	{
	plan tests => 1;

	pod_coverage_ok( "HTTP::SimpleLinkChecker" );      
	}
