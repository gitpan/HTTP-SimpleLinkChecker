# $Id: Makefile.PL,v 1.3 2002/01/23 11:12:55 comdog Exp $
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'HTTP::SimpleLinkChecker',
    'VERSION_FROM' => 'SimpleLinkChecker.pm', # finds $VERSION
	'PREREQ_PM' => { 'HTTP::Request' => undef },
);
