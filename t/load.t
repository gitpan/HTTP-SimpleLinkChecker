# $Id: load.t,v 1.1 2004/09/08 02:20:42 comdog Exp $
BEGIN { @classes = qw(HTTP::SimpleLinkChecker) }

use Test::More tests => scalar @classes;
	
foreach my $class ( @classes )
	{
	print "Bail out!" unless use_ok( $class );
	}
