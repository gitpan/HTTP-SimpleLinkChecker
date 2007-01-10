# $Id: export.t,v 1.1 2006/12/26 02:19:33 comdog Exp $

use Test::More tests => 1;

use HTTP::SimpleLinkChecker qw(check_link);

ok( defined &check_link, "check_link was exported" );
