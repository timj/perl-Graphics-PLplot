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
c_plbox(xopt, xtick, nxsub, yopt, ytick, nysub)
  char * xopt
  PLFLT xtick
  PLINT nxsub
  char * yopt
  PLFLT ytick
  PLINT nysub


void
c_plcol0( colindex )
 PLINT colindex

# plinit

void
c_plinit()

# plend

void
c_plend()


# plenv

void
c_plenv( xmin, xmax, ymin, ymax, just, axis )
  PLFLT xmin
  PLFLT xmax
  PLFLT ymin
  PLFLT ymax
  PLINT just
  PLINT axis

# plflush

void
c_plflush()


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


# plsdev

void
plsdev( devname )
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

