#!perl

# Perl version of the PLPLOT C x02c.c example [colored text]

#
# This version Copyright (C) 2004 Tim Jenness. All Rights Reserved.
#
# This program is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; either version 2 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful,but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, write to the Free Software Foundation, Inc., 59 Temple
# Place,Suite 330, Boston, MA  02111-1307, USA
#

use strict;
use Test::More tests => 1;
use Math::Trig qw/ pi /;
use Data::Dumper;
require_ok("Graphics::PLPLOT");

print "# Version: ". &Graphics::PLPLOT::plgver() ."\n";

# 16 regions
Graphics::PLPLOT::plssub( 4, 4);

# Initialise plplot 

Graphics::PLPLOT::plsdev( "xwin" );
Graphics::PLPLOT::plinit();

Graphics::PLPLOT::plschr( 0.0, 3.5 );
Graphics::PLPLOT::plfont( 4 );

for ( my $i = 0; $i <= 15 ; $i ++ ) {
  Graphics::PLPLOT::plcol0( $i );
  my $text = $i;
  Graphics::PLPLOT::pladv( 0 );
  my $vmin = 0.1;
  my $vmax = 0.9;

  for (my $j = 0; $j <= 2; $j++ ) {
    print "VMIN: $vmin MAX: $vmax  J $j I $i TEXT: $text\n";
    Graphics::PLPLOT::plwid( $j + 1 );
    Graphics::PLPLOT::plvpor( $vmin, $vmax, $vmin, $vmax );
    Graphics::PLPLOT::plwind( 0.0, 1.0, 0.0, 1.0);
    Graphics::PLPLOT::plbox( "bc", 0, 0, "bc", 0, 0);
    $vmin += 0.1;
    $vmax -= 0.1;
  }
  Graphics::PLPLOT::plwid( 1 );
  Graphics::PLPLOT::plptex( 0.5, 0.5, 1.0, 0.0, 0.5, $text );
}


Graphics::PLPLOT::plend();
 
print "# Ending \n";
 
exit;
