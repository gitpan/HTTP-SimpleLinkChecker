use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

require 5.006;

eval "use Test::Manifest 1.14";

WriteMakefile(
	'NAME'         => 'HTTP::SimpleLinkChecker',
	'ABSTRACT'     => 'Check the HTTP response code for a link',
	'VERSION_FROM' => 'SimpleLinkChecker.pm',
	'LICENSE'      => 'perl',
	'AUTHOR'       => 'brian d foy <bdfoy@cpan.org>',

	'EXE_FILES'    => [ qw(script/httpstatus) ],
	
	'PREREQ_PM'    => { 
		'HTTP::Request'  => '1.28',
		'LWP::UserAgent' => '1.09',
		},
		
	'MAN3PODS'     => {
		'SimpleLinkChecker.pm' => '$(INST_MAN3DIR)/HTTP::SimpleLinkChecker.3',
		},

	'dist'         => {
		'COMPRESS'        => 'gzip -9f',
		'SUFFIX'          => 'gz',
		},

    clean  => { FILES    => q|HTTP-SimpleLinkChecker-*| },

);
