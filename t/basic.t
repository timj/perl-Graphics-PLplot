#!perl

use Test::More tests => 1;
use Data::Dumper;
require_ok("Graphics::PLPLOT");

print "# Version: ". &Graphics::PLPLOT::plgver() ."\n";

Graphics::PLPLOT::plssub( 2, 2);
Graphics::PLPLOT::plsdev( "xwin" );
Graphics::PLPLOT::plinit();

#&plot1( 1, 0.0014, 0, 0.0185);
&plot1( 6, 1, 0, 0.0);
print "Plotted\n";

Graphics::PLPLOT::plend();

print "# Ending \n";

exit;

# First plot
sub plot1 {
  my ($xscale, $yscale, $xoff, $yoff ) = @_;

  # Setup some arrays for plotting
  my @x;
  my @y;
  for my $i ( 1..60 ) {
    my $x = $xoff + ($xscale * $i / 60.0);
    my $y = $yoff + ($yscale * ( $x ** 2));
    push(@x, $x);
    push(@y, $y);
  }

  my $xmin = $x[0];
  my $xmax = $x[-1];
  my $ymin = $y[0];
  my $ymax = $y[-1];

  print "# xmin xmax ymin ymax $xmin $xmax $ymin $ymax \n";

  my @idx = map { $_ * 10 + 3 } (0..5);
  my @xs = map { $x[$_] } @idx;
  my @ys = map { $y[$_] } @idx;


  # Set up the viewport and window using PLENV. The range in X is
  # 0.0 to 6.0, and the range in Y is 0.0 to 30.0. The axes are
  # scaled separately (just = 0), and we just draw a labelled
  # box (axis = 0).

  Graphics::PLPLOT::plcol0( 1 );
  Graphics::PLPLOT::plenv( $xmin, $xmax, $ymin, $ymax, 0, 0);
  Graphics::PLPLOT::plcol0( 2 );
  Graphics::PLPLOT::pllab( "(x)", "(y)", "#frPLplot Example 1 - y=x#u2");

  # plot the data points

  Graphics::PLPLOT::plcol0( 4 );
  Graphics::PLPLOT::plpoin( \@xs, \@ys, 9 );

  # Draw the line through the data

  Graphics::PLPLOT::plcol0( 3 );
  Graphics::PLPLOT::plline( \@x, \@y );

}
