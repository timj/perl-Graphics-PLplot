/*

  PLPLOT.xs

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
 
*/
 
#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"   /* std perl include */
#include "perl.h"     /* std perl include */
#include "XSUB.h"     /* XSUB include */
  /* #include "ppport.h" */
#ifdef __cplusplus
}
#endif

#include "plplot/plplot.h"
#include "arrays.h"

MODULE = Graphics::PLPLOT     PACKAGE = Graphics::PLPLOT PREFIX = c_


void
pl_setcontlabelformat( lexp, sigdig )
  PLFLT lexp
  PLFLT sigdig


void
pl_setcontlabelparam( offset, size, active, spacing )
  PLFLT offset
  PLFLT size
  PLFLT active
  PLFLT spacing

void
c_pladv( sub )
  PLINT sub


void
c_plaxes( x0, y0, xopt, xtick, nxsub, yopt, ytick, nysub )
  PLFLT x0
  PLFLT y0
  char * xopt
  PLFLT xtick
  PLINT nxsub
  char * yopt
  PLFLT ytick
  PLINT nysub

void
c_plbin( x, y, center )
  PLFLT * x
  PLFLT * y
  PLINT center
 PREINIT:
  PLINT len = av_len( (AV*)SvRV(ST(0)) ) + 1;
 CODE:
  c_plbin( len, x, y, center);

void
c_plbop()
 ALIAS:
  plpage = 1

void
c_plbox(xopt, xtick, nxsub, yopt, ytick, nysub)
  char * xopt
  PLFLT xtick
  PLINT nxsub
  char * yopt
  PLFLT ytick
  PLINT nysub

void
c_plbox3( xopt, xlabel, xtick, nxsub, yopt, ylabel, ytick, nysub, zopt, zlabel, ztick, nzsub)
  char * xopt
  char * xlabel
  PLFLT xtick
  PLINT nxsub
  char * yopt
  char * ylabel
  PLFLT ytick
  PLINT nysub
  char * zopt
  char * zlabel
  PLFLT ztick
  PLINT nzsub

# ($wx, $wy, $window ) = plcalc_world( $rx, $ry );

void
c_plcalc_world( rx, ry)
  PLFLT rx
  PLFLT ry
 PREINIT:
  PLFLT wx;
  PLFLT wy;
  PLINT window;
 PPCODE:
  c_plcalc_world( rx, ry, &wx, &wy, &window );
  XPUSHs( sv_2mortal(newSVnv(wx)));
  XPUSHs( sv_2mortal(newSVnv(wy)));
  XPUSHs( sv_2mortal(newSViv(window)));


void
c_plclear()


void
c_plcol0( color )
  PLINT color
 ALIAS:
  plcol = 1

void
c_plcol1( color )
  PLFLT color

# plcont XXXXX

# plcpstrm

void
c_plcpstrm( iplsr, flags)
  PLINT iplsr
  PLINT flags


# plend

void
c_plend()

void
c_plend1()

# plenv

void
c_plenv( xmin, xmax, ymin, ymax, just, axis )
  PLFLT xmin
  PLFLT xmax
  PLFLT ymin
  PLFLT ymax
  PLINT just
  PLINT axis

void
c_plenv0( xmin, xmax, ymin, ymax, just, axis )
  PLFLT xmin
  PLFLT xmax
  PLFLT ymin
  PLFLT ymax
  PLINT just
  PLINT axis

void
c_pleop()
 ALIAS:
  plclr = 1

void
c_plerrx( xmin, xmax, y )
  PLFLT * xmin
  PLFLT * xmax
  PLFLT * y
 PREINIT:
  PLINT n = av_len( (AV*)SvRV(ST(0)) ) + 1;
 CODE:
  c_plerrx( n, xmin, xmax, y );


void
c_plerry( x, ymin, ymax )
  PLFLT * x
  PLFLT * ymin
  PLFLT * ymax
 PREINIT:
  PLINT n = av_len( (AV*)SvRV(ST(0)) ) + 1;
 CODE:
  c_plerry( n, x, ymin, ymax );


# plflush

void
c_plflush()

# plfont

void
c_plfont( input )
  PLINT input

void
c_plfontld( set )
  PLINT set


# plgvers

char *
c_plgver()
 PREINIT:
   char ver[80];
 CODE:
   RETVAL = ver;
   c_plgver( RETVAL );
 OUTPUT:
   RETVAL



void
c_plhist( data, datmin, datmax, nbin, oldwin )
  PLFLT * data
  PLFLT datmin
  PLFLT datmax
  PLINT nbin
  PLINT oldwin
 PREINIT:
  PLINT len = av_len( (AV*)SvRV(ST(0)) ) + 1;
 CODE:
  c_plhist( len, data, datmin, datmax, nbin, oldwin);

# plinit

void
c_plinit()



# pllab

void
c_pllab( xlabel, ylabel, tlabel)
  char * xlabel
  char * ylabel
  char * tlabel


# plline

void
c_plline( x, y )
  PLFLT * x
  PLFLT * y
 PREINIT:
  PLINT len = av_len( (AV*)SvRV(ST(0)) ) + 1;
 CODE:
  c_plline( len, x, y );


# plpoin

void
c_plpoin( x, y, code )
  PLFLT * x
  PLFLT * y
  PLINT code
 PREINIT:
  PLINT len = av_len( (AV*)SvRV(ST(0)) ) + 1;
 CODE:
  c_plpoin( len, x, y, code);

# plptex

void
c_plptex( x, y, dx, dy, just, text )
  PLFLT x
  PLFLT y
  PLFLT dx
  PLFLT dy
  PLFLT just
  char * text

# plschr

void
c_plschr( def, scale )
  PLFLT def
  PLFLT scale

# plsdev

void
c_plsdev( devname )
  char * devname

# plssub

void
c_plssub( nx, ny )
  PLINT nx
  PLINT ny

# plstyl - empty arrays are allowed

void
c_plstyl( mark, space )
  PLINT * mark
  PLINT * space
 PREINIT:
  PLINT nels = av_len( (AV*)SvRV(ST(0)) ) + 1;
 CODE:
  c_plstyl( nels, mark, space );


void
c_plsyax( digimax, digits )
  PLINT digimax
  PLINT digits

void
c_plvpor( xmin, xmax, ymin, ymax )
  PLFLT xmin
  PLFLT xmax
  PLFLT ymin
  PLFLT ymax

void
c_plvsta()

void
c_plwid( width )
  PLINT width

void
c_plwind( xmin, xmax, ymin, ymax )
  PLFLT xmin
  PLFLT xmax
  PLFLT ymin
  PLFLT ymax
