#!perl

use strict;
use ExtUtils::MakeMaker;

# Libs required to build PLPLOT applications
my $pllibs = '-L/usr/local/lib -lplplotd -L/usr/X11R6/lib -lX11';

# Include files
my $plinc = '-I/usr/local/include';

# Write the makefile
WriteMakefile(
	      NAME => 'Graphics::PLPLOT',
	      VERSION_FROM => 'PLPLOT.pm',
	      LIBS => [ $pllibs ],
	      INC  => "$plinc",
	      OBJECT  => 'PLPLOT.o arrays.o',
	      'dist'      => {'COMPRESS'=>'gzip -9f', 'SUFFIX' => 'gz',
			      'ZIP'=>'/usr/bin/zip','ZIPFLAGS'=>'-rl'},
	      ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
	       (ABSTRACT_FROM => 'PLPLOT.pm',
		AUTHOR     => 'Tim Jenness <t.jenness@jach.hawaii.edu>') : ()),
);
