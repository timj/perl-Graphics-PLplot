package Graphics::PLPLOT;

=head1 NAME

Graphics::PLPLOT - Perl interface to the PLPLOT plotting library

=head1 SYNOPSIS

  use Graphics::Plot qw/ :all /;

  plsdev( "xwin" );
  plinit();
  plcol0(1);

  plenv( -1, 1, -1, 1, 1, -2 );
  plline(\@x, \@y);

  plend();

=head1 DESCRIPTION

This module provides a perl interface to the PLPLOT plotting library
available from http://www.plplot.org. The interface is very similar
to the C interface except that:

 - Arrays are passed in by reference
 - If the number of elements in an array are required by the C function
   the perl interface calculates this automatically [eg plline]
 - Return values are returned not supplied as arguments

=cut

use vars qw/ $VERSION %EXPORT_TAGS /;
$VERSION = '0.01';

require DynaLoader;
require Exporter;
use base qw/ Exporter DynaLoader /;

# Setup export tags
# Simple to generate from XS:
# cat grep c_pl PLPLOT.xs | awk -F\( '{print $1}' | sort | uniq
%EXPORT_TAGS = (
		
		'all'=>[qw/
			   pladv
			   plaxes
			   plbin
			   plbop
			   plbox
			   plbox3
			   plcalc_world
			   plclear
			   plcol0
			   plcol1
			   plcpstrm
			   plend
			   plend1
			   plenv
			   plenv0
			   pleop
			   plerrx
			   plerry
			   plfamadv
			   plfill
			   plfill3
			   plflush
			   plfont
			   plfontld
			   plgchr
			   plgcol0
			   plgcolbg
			   plgcompression
			   plgdev
			   plgdidev
			   plgdiori
			   plgdiplt
			   plgfam
			   plgfnam
			   plglevel
			   plgpage
			   plgra
			   plgspa
			   plgstrm
			   plgver
			   plgvpd
			   plgvpw
			   plgxax
			   plgyax
			   plgzax
			   plhist
			   plinit
			   pljoin
			   pllab
			   pllightsource
			   plline
			   plline3
			   pllsty
			   plmkstrm
			   plmtex
			   plpat
			   plpoin
			   plpoin3
			   plpoly3
			   plprec
			   plpsty
			   plptex
			   plreplot
			   plschr
			   plscmap0
			   plscmap0n
			   plscmap1
			   plscmap1l
			   plscmap1n
			   plscol0
			   plscolbg
			   plscolor
			   plscompression
			   plsdev
			   plsdidev
			   plsdiori
			   plsdiplt
			   plsdiplz
			   plsesc
			   plsetopt
			   plsfam
			   plsfnam
			   plsmaj
			   plsmin
			   plsori
			   plspage
			   plspause
			   plsstrm
			   plssub
			   plssym
			   plstar
			   plstart
			   plstripa
			   plstripc
			   plstyl
			   plsyax
			   plsym
			   plsvpa
			   plvpor
			   plvsta
			   plwid
			   plwind
			   /],
	       );

Exporter::export_tags('all');

bootstrap Graphics::PLPLOT $VERSION;

=head1 EXAMPLES

This module is distributed with Perl versions of many of the C example
files that are distributed as part of PLPLOT itself. They can be
used to learn the Perl interface.

=head1 TODO

This module is not yet complete since only a subset of the PLPLOT
functions are available. More will be added as I get time to implement
them.

=head1 SEE ALSO

The L<PDL::Graphics::PLPLOT> module (distributed with L<PDL|PDL>
is more suitable for plotting large data arrays. This module exists
primarily for cases where a dependency on PDL is not desirable.

The PLPLOT library is very similar to the PGPLOT library (see
the L<PGPLOT|PGPLOT> module).

The L<Starlink::AST|Starlink::AST> module provides a graphics
interface to this PLPLOT module.

=head1 AUTHOR

Tim Jenness E<lt>t.jenness@jach.hawaii.eduE<gt>

Copyright (C) 2004 Tim Jenness. All Rights Reserved.

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation; either version 2 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful,but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program; if not, write to the Free Software Foundation, Inc., 59 Temple
Place,Suite 330, Boston, MA  02111-1307, USA

=cut

1;
