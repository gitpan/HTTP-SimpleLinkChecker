# $Id: prereq.t 1448 2004-09-08 02:20:42Z comdog $
use Test::More;
eval "use Test::Prereq";
plan skip_all => "Test::Prereq required to test dependencies" if $@;
prereq_ok();
