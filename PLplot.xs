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

void
c_plfamadv()

void
c_plfill( x, y )
  PLFLT * x
  PLFLT * y
 PREINIT:
  PLINT len = av_len( (AV*)SvRV(ST(0)) ) + 1;
 CODE:
  c_plfill( len, x, y );

void
c_plfill3( x, y, z )
  PLFLT * x
  PLFLT * y
  PLFLT * z
 PREINIT:
  PLINT len = av_len( (AV*)SvRV(ST(0)) ) + 1;
 CODE:
  c_plfill3( len, x, y, z );


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

# plgchr

void
c_plgchr()
 PREINIT:
  PLFLT p_def;
  PLFLT p_ht;
 PPCODE:
  c_plgchr( &p_def, &p_ht );
  XPUSHs( sv_2mortal(newSVnv(p_def)));
  XPUSHs( sv_2mortal(newSVnv(p_ht)));

void
c_plgcol0(icol0)
  PLINT icol0
 PREINIT:
  PLINT r;
  PLINT g;
  PLINT b;
 PPCODE:
  c_plgcol0( icol0, &r, &g, &b );
  XPUSHs( sv_2mortal(newSViv(r)));
  XPUSHs( sv_2mortal(newSViv(g)));
  XPUSHs( sv_2mortal(newSViv(b)));

void
c_plgcolbg()
 PREINIT:
  PLINT r;
  PLINT g;
  PLINT b;
 PPCODE:
  c_plgcolbg( &r, &g, &b );
  XPUSHs( sv_2mortal(newSViv(r)));
  XPUSHs( sv_2mortal(newSViv(g)));
  XPUSHs( sv_2mortal(newSViv(b)));

PLINT
plgcompression()
 CODE:
  plgcompression( &RETVAL );
 OUTPUT:
  RETVAL

char *
c_plgdev()
 PREINIT:
   char ver[80];
 CODE:
   RETVAL = ver;
   c_plgdev( RETVAL );
 OUTPUT:
   RETVAL

void
c_plgdidev()
 PREINIT:
  PLFLT p_mar;
  PLFLT p_aspect;
  PLFLT p_jx;
  PLFLT p_jy;
 PPCODE:
  c_plgdidev( &p_mar, &p_aspect, &p_jx, &p_jy );
  XPUSHs( sv_2mortal(newSVnv(p_mar)));
  XPUSHs( sv_2mortal(newSVnv(p_aspect)));
  XPUSHs( sv_2mortal(newSVnv(p_jx)));
  XPUSHs( sv_2mortal(newSVnv(p_jy)));

PLFLT
plgdiori()
 CODE:
  plgdiori( &RETVAL );
 OUTPUT:
  RETVAL

void
c_plgdiplt()
 PREINIT:
  PLFLT p_xmin;
  PLFLT p_ymin;
  PLFLT p_xmax;
  PLFLT p_ymax;
 PPCODE:
  c_plgdiplt( &p_xmin, &p_ymin, &p_xmax, &p_ymax );
  XPUSHs( sv_2mortal(newSVnv(p_xmin)));
  XPUSHs( sv_2mortal(newSVnv(p_ymin)));
  XPUSHs( sv_2mortal(newSVnv(p_xmax)));
  XPUSHs( sv_2mortal(newSVnv(p_ymax)));


void
c_plgfam()
 PREINIT:
  PLINT fam;
  PLINT num;
  PLINT bmax;
 PPCODE:
  c_plgfam( &fam, &num, &bmax );
  XPUSHs( sv_2mortal(newSViv(fam)));
  XPUSHs( sv_2mortal(newSViv(num)));
  XPUSHs( sv_2mortal(newSViv(bmax)));


char *
c_plgfnam()
 PREINIT:
   char ver[80];
 CODE:
   RETVAL = ver;
   c_plgfnam( RETVAL );
 OUTPUT:
   RETVAL

PLINT
c_plglevel()
 CODE:
   c_plglevel( &RETVAL );
 OUTPUT:
   RETVAL

void
c_plgpage()
 PREINIT:
  PLFLT xp;
  PLFLT yp;
  PLINT xleng;
  PLINT yleng;
  PLINT xoff;
  PLINT yoff;
 PPCODE:
  c_plgpage( &xp, &yp, &xleng, &yleng, &xoff, &yoff);
  XPUSHs( sv_2mortal(newSVnv(xp)));
  XPUSHs( sv_2mortal(newSVnv(yp)));
  XPUSHs( sv_2mortal(newSViv(xleng)));
  XPUSHs( sv_2mortal(newSViv(yleng)));
  XPUSHs( sv_2mortal(newSViv(xoff)));
  XPUSHs( sv_2mortal(newSViv(yoff)));

void
plgra()

#  plgriddata - XXXXX Not yet
#    Need to know what to do with the 1-D perl output array
#    How do we make it usable without PDL?


void
c_plgspa()
 PREINIT:
  PLFLT xmin;
  PLFLT ymin;
  PLFLT xmax;
  PLFLT ymax;
 PPCODE:
  c_plgspa( &xmin, &ymin, &xmax, &ymax );
  XPUSHs( sv_2mortal(newSVnv(xmin)));
  XPUSHs( sv_2mortal(newSVnv(ymin)));
  XPUSHs( sv_2mortal(newSVnv(xmax)));
  XPUSHs( sv_2mortal(newSVnv(ymax)));


PLINT
c_plgstrm()
 CODE:
   c_plgstrm( &RETVAL );
 OUTPUT:
   RETVAL


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

# plgvpd
void
c_plgvpd()
 PREINIT:
  PLFLT p_xmin;
  PLFLT p_xmax;
  PLFLT p_ymin;
  PLFLT p_ymax;
 PPCODE:
  c_plgvpd( &p_xmin, &p_xmax, &p_ymin, &p_ymax );
  XPUSHs( sv_2mortal(newSVnv(p_xmin)));
  XPUSHs( sv_2mortal(newSVnv(p_xmax)));
  XPUSHs( sv_2mortal(newSVnv(p_ymin)));
  XPUSHs( sv_2mortal(newSVnv(p_ymax)));

void
c_plgvpw()
 PREINIT:
  PLFLT p_xmin;
  PLFLT p_xmax;
  PLFLT p_ymin;
  PLFLT p_ymax;
 PPCODE:
  c_plgvpw( &p_xmin, &p_xmax, &p_ymin, &p_ymax );
  XPUSHs( sv_2mortal(newSVnv(p_xmin)));
  XPUSHs( sv_2mortal(newSVnv(p_xmax)));
  XPUSHs( sv_2mortal(newSVnv(p_ymin)));
  XPUSHs( sv_2mortal(newSVnv(p_ymax)));

void
c_plgxax()
 PREINIT:
  PLINT digmax;
  PLINT digits;
 PPCODE:
  c_plgxax( &digmax, &digits );
  XPUSHs( sv_2mortal(newSViv(digmax)));
  XPUSHs( sv_2mortal(newSViv(digits)));

void
c_plgyax()
 PREINIT:
  PLINT digmax;
  PLINT digits;
 PPCODE:
  c_plgyax( &digmax, &digits );
  XPUSHs( sv_2mortal(newSViv(digmax)));
  XPUSHs( sv_2mortal(newSViv(digits)));

void
c_plgzax()
 PREINIT:
  PLINT digmax;
  PLINT digits;
 PPCODE:
  c_plgzax( &digmax, &digits );
  XPUSHs( sv_2mortal(newSViv(digmax)));
  XPUSHs( sv_2mortal(newSViv(digits)));



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


# plhls is now deprecated


# plinit

void
c_plinit()

void
c_pljoin( x1, y1, x2, y2 )
 PLFLT x1
 PLFLT y1
 PLFLT x2
 PLFLT y2


# pllab

void
c_pllab( xlabel, ylabel, tlabel)
  char * xlabel
  char * ylabel
  char * tlabel

void
c_pllightsource(x,y,z )
  PLFLT x
  PLFLT y
  PLFLT z

# plline

void
c_plline( x, y )
  PLFLT * x
  PLFLT * y
 PREINIT:
  PLINT len = av_len( (AV*)SvRV(ST(0)) ) + 1;
 CODE:
  c_plline( len, x, y );

void
c_plline3( x, y, z )
  PLFLT * x
  PLFLT * y
  PLFLT * z
 PREINIT:
  PLINT len = av_len( (AV*)SvRV(ST(0)) ) + 1;
 CODE:
  c_plline3( len, x, y, z );

void
c_pllsty( input )
  PLINT input

# plmesh - not yet XXXXX

# plmeshc - not yet XXXXX

PLINT
c_plmkstrm()
 CODE:
   c_plmkstrm( &RETVAL );
 OUTPUT:
   RETVAL

# plmtex

void
c_plmtex( side, disp, pos, just, text )
  char * side
  PLFLT disp
  PLFLT pos
  PLFLT just
  char * text

# plot3d - not yet  XXXXX
# plot3dc - not yet  XXXXX

# plpage - see plbop



void
c_plpat( inc, del )
  PLINT * inc
  PLINT * del
 PREINIT:
  PLINT len = av_len( (AV*)SvRV(ST(0)) ) + 1;
 CODE:
  c_plpat( len, inc, del);



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

void
c_plpoin3( x, y, z, code )
  PLFLT * x
  PLFLT * y
  PLFLT * z
  PLINT code
 PREINIT:
  PLINT len = av_len( (AV*)SvRV(ST(0)) ) + 1;
 CODE:
  c_plpoin3( len, x, y, z, code);

void
c_plpoly3( x, y, z, draw, ifcc )
  PLFLT * x
  PLFLT * y
  PLFLT * z
  PLINT * draw
  PLINT ifcc
 PREINIT:
  PLINT len = av_len( (AV*)SvRV(ST(0)) ) + 1;
 CODE:
  c_plpoly3( len, x, y, z, draw, ifcc);

void
c_plprec( set, prec )
  PLINT set
  PLINT prec

void
c_plpsty(n)
  PLINT n

# plptex

void
c_plptex( x, y, dx, dy, just, text )
  PLFLT x
  PLFLT y
  PLFLT dx
  PLFLT dy
  PLFLT just
  char * text

void
c_plreplot()

# plrgb - deprecated

# plschr

void
c_plschr( def, scale )
  PLFLT def
  PLFLT scale

void
c_plscmap0( r, g, b )
  PLINT * r
  PLINT * g
  PLINT * b
 PREINIT:
  PLINT len = av_len( (AV*)SvRV(ST(0)) ) + 1;
 CODE:
  c_plscmap0( r, g, b, len );

void
c_plscmap0n( ncol0 )
  PLINT ncol0

void
c_plscmap1( r, g, b )
  PLINT * r
  PLINT * g
  PLINT * b
 PREINIT:
  PLINT len = av_len( (AV*)SvRV(ST(0)) ) + 1;
 CODE:
  c_plscmap1( r, g, b, len );

# plscmap1l - need to allow rev to be an empty array. XXXXX

void
c_plscmap1l(itype, pos, coord1, coord2, coord3, rev)
  PLINT itype
  PLFLT * pos
  PLFLT * coord1
  PLFLT * coord2
  PLFLT * coord3
  PLINT * rev
 PREINIT:
  PLINT len = av_len( (AV*)SvRV(ST(0)) ) + 1;
 CODE:
  c_plscmap1l( itype, len, pos, coord1, coord2, coord3, rev);


void
c_plscmap1n( ncol1 )
  PLINT ncol1

void
c_plscol0( icol0, r, g, b)
  PLINT icol0
  PLINT r
  PLINT g
  PLINT b

void
c_plscolbg( r, g, b)
  PLINT r
  PLINT g
  PLINT b

void
c_plscolor( color )
  bool color
 CODE:
  c_plscolor( (PLINT)color );

void
c_plscompression( compression )
  PLINT compression

# plsdev

void
c_plsdev( devname )
  char * devname

void
c_plsdidev( mar, aspect, jx, jy)
  PLFLT mar
  PLFLT aspect
  PLFLT jx
  PLFLT jy

# plsdimap - Not yet public interface

void
c_plsdiori( rot )
  PLFLT rot

void
c_plsdiplt( xmin, ymin, xmax, ymax )
  PLFLT xmin
  PLFLT ymin
  PLFLT xmax
  PLFLT ymax

void
c_plsdiplz( xmin, ymin, xmax, ymax )
  PLFLT xmin
  PLFLT ymin
  PLFLT xmax
  PLFLT ymax

void
c_plsesc( esc )
  char esc

void
c_plsetopt( opt, optarg )
  char * opt
  char * optarg

void
c_plsfam( fam, num, bmax )
  PLINT fam
  PLINT num
  PLINT bmax

void
c_plsfnam( input )
  char * input

# plshades NOT YET - XXXX

void
c_plsmaj( def, scale )
  PLFLT def
  PLFLT scale

# plsmem - NOT YET XXXX

void
c_plsmin( def, scale )
  PLFLT def
  PLFLT scale

void
c_plsori( ori )
  PLINT ori

void
c_plspage( xp, yp, xleng, yleng, xoff, yoff )
  PLFLT xp
  PLFLT yp
  PLINT xleng
  PLINT yleng
  PLINT xoff
  PLINT yoff

void
c_plspause( pause )
  bool pause
 CODE:
  c_plspause( (PLINT)pause );

void
c_plsstrm( strm )
  PLINT strm

# plssub

void
c_plssub( nx, ny )
  PLINT nx
  PLINT ny

void
c_plssym( def, scale)
  PLFLT def
  PLFLT scale

void
c_plstar(nx, ny)
 PLINT nx
 PLINT ny

void
c_plstart(device, nx, ny)
  char * device
  PLINT nx
  PLINT ny

void
c_plstripa(id, p, x, y)
  PLINT id
  PLINT p
  PLFLT x
  PLFLT y

#PLINT
#c_plstripc(xspec,yspec,xmin,xmax,xjump,ymin,ymax,xlpos,ylpos,y_ascl,acc,colbox, collab,colline,styline,legline,labx,laby,labtop)
# CODE:



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

# plpoin

void
c_plsym( x, y, code )
  PLFLT * x
  PLFLT * y
  PLINT code
 PREINIT:
  PLINT len = av_len( (AV*)SvRV(ST(0)) ) + 1;
 CODE:
  c_plsym( len, x, y, code);

void
c_plsvpa(xmin, xmax, ymin, ymax)
  PLFLT xmin
  PLFLT xmax
  PLFLT ymin
  PLFLT ymax

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
