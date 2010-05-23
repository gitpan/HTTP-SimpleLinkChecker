use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

require 5.006;

eval "use Test::Manifest 1.21";

WriteMakefile(
	'NAME'         => 'HTTP::SimpleLinkChecker',
	'ABSTRACT'     => 'Check the HTTP response code for a link',
	'VERSION_FROM' => 'lib/SimpleLinkChecker.pm',
	'LICENSE'      => 'perl',
	'AUTHOR'       => 'brian d foy <bdfoy@cpan.org>',

	'PM'           => {
		'lib/SimpleLinkChecker.pm' => '$(INST_LIBDIR)/SimpleLinkChecker.pm',
		},

	'EXE_FILES'    => [ qw(script/http_status) ],
	
	'PREREQ_PM'    => { 
		'HTTP::Request'  => '1.28',
		'HTTP::Status'   => '0',
		'LWP::UserAgent' => '1.09',
		},
		
	'MAN3PODS'     => {
		'lib/SimpleLinkChecker.pm' => '$(INST_MAN3DIR)/HTTP::SimpleLinkChecker.$(MAN3EXT)',
		},

    clean  => { FILES    => q|HTTP-SimpleLinkChecker-*| },

    (
    ( $ExtUtils::MakeMaker::VERSION ge '6.46' )
        ? (META_MERGE => {
            resources => {
                homepage    => 'http://github.com/briandfoy/http-simplelinkchecker',
                repository  => 'git://github.com/briandfoy/http-simplelinkchecker.git',
            }
        })
        : ()
    )

);
