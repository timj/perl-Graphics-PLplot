#!perl

# Perl version of the PLPLOT C x05c.c example

use strict;
use Test::More tests => 1;
use Math::Trig qw/ pi /;
require_ok("Graphics::PLPLOT");

print "# Version: ". &Graphics::PLPLOT::plgver() ."\n";

Graphics::PLPLOT::plsdev( "xwin" );
Graphics::PLPLOT::plinit();

# Fill up data points
use constant NPTS => 2047;
my $delta = 2 * pi / NPTS;
my @data = map { sin($_ * $delta) } (0..NPTS);

Graphics::PLPLOT::plcol0(1);
Graphics::PLPLOT::plhist(\@data, -1.1,1.1,44,0);
Graphics::PLPLOT::plcol0(2);
Graphics::PLPLOT::pllab("#frValue", "#frFrequency",
          "#frPLplot Example 5 - Probability function of Oscillator");


Graphics::PLPLOT::plend();

print "# Ending \n";

exit;
