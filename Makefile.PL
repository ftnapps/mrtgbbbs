use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'mrtgbbbs',
    AUTHOR              => q{Robert James Clay <jame@rocasa.us>},
    VERSION_FROM        => 'bin/mrtgbbbs.pl',
    ABSTRACT            => 'Perl script for reading the MRTG information from the BBBS standard port.',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    EXE_FILES           => [ qw( bin/mrtgbbbs.pl ) ],
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'mrtgbbbs-*' },
);
