use Test::More tests => 5;

use_ok( 'HTTP::SimpleLinkChecker' );

ok( defined &HTTP::SimpleLinkChecker::user_agent );

my $UA = &HTTP::SimpleLinkChecker::user_agent();
isa_ok( $UA, 'LWP::UserAgent');

like( $UA->agent, qr/libwww-perl/ );

my $new_name = "brian's link checker";
$UA->agent( $new_name );
is( $UA->agent, $new_name );
