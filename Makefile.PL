use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

eval "use Test::Manifest 1.14";

WriteMakefile(
	'NAME'         => 'HTTP::SimpleLinkChecker',
	'VERSION_FROM' => 'SimpleLinkChecker.pm',

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
