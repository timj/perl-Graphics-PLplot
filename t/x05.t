#!perl

# Perl version of the PLPLOT C x05c.c histogram example
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
