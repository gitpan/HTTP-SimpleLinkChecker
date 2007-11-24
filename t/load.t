# $Id: load.t 1448 2004-09-08 02:20:42Z comdog $
BEGIN { @classes = qw(HTTP::SimpleLinkChecker) }

use Test::More tests => scalar @classes;
	
foreach my $class ( @classes )
	{
	print "Bail out!" unless use_ok( $class );
	}
