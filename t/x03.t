#!perl

# Perl version of the PLPLOT C x03c.c example

use strict;
use Test::More tests => 1;
use Math::Trig qw/ pi /;
require_ok("Graphics::PLPLOT");
 
print "# Version: ". &Graphics::PLPLOT::plgver() ."\n";
 
Graphics::PLPLOT::plsdev( "xwin" );
Graphics::PLPLOT::plinit();

# Set up viewport and window but do not draw box
Graphics::PLPLOT::plenv(-1.3,1.3,-1.3,1.3,1,-2);

my $dtr = pi / 180.0;
my @x0 = map { cos( $dtr * $_  ) } (0..360);
my @y0 = map { sin( $dtr * $_  ) } (0..360);

my (@x,@y);
for my $i (1..10) {
  my @x = map { 0.1 * $i * $_ } @x0;
  my @y = map { 0.1 * $i * $_ } @y0;

  # Draw circles for polar grid
  Graphics::PLPLOT::plline( \@x, \@y);

}

Graphics::PLPLOT::plcol0(2);
for my $i ( 0 .. 11 ) {
  my $theta = 30 * $i;
  my $dx = cos ( $dtr * $theta );
  my $dy = sin ( $dtr * $theta );

  # Draw radial spokes for polar grid
  Graphics::PLPLOT::pljoin( 0, 0, $dx, $dy);

  # Write labels for angle
  # Slightly off zero to avoid floating point logic flipts 
  # at 90 and 270 deg
  if ($dx >= -0.00001) {
    Graphics::PLPLOT::plptex($dx, $dy, $dx, $dy, -0.15, int($theta));
  } else {
    Graphics::PLPLOT::plptex($dx, $dy, -$dx, -$dy, 1.15, int($theta));
  }

}

# Draw the graph
for my $i (0 .. $#x0) {
  my $r = sin( $dtr * 5 * $i);
  $x[$i] = $x0[$i] * $r;
  $y[$i] = $y0[$i] * $r;
}

Graphics::PLPLOT::plcol0(3);
Graphics::PLPLOT::plline(\@x, \@y);
Graphics::PLPLOT::plcol0(4);
Graphics::PLPLOT::plmtex("t",2,0.5,0.5,"#frPLplot Example 3 - r(#gh)=sin 5#gh");

Graphics::PLPLOT::plend();

print "# Ending \n";

exit;
