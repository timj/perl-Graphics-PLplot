#!perl

# Perl version of the PLPLOT C x01c.c example

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
