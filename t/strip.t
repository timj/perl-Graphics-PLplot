#!perl

# Demo of StripChart
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
use Test::More tests => 3;
use Math::Trig qw/ pi /;
BEGIN {
  use_ok("Graphics::PLplot");
  Graphics::PLplot->import(qw/ :all /);
}

print "# Version: ". &plgver() ."\n";

my @text = qw/ Maurice Geoffrey Alan Rafael Vince /;
my @per  = ( 10, 32, 12, 30, 16 );

my $dev = "xwin";
plsdev( $dev );
is(plgdev, $dev, "Check device");
plinit();

pladv(0);
plvpor(0,1,0,1);
plcol0(2);


my $strip = plstripc("bcnst","bcnst",0,5,0.05,0,5,0.9,0.9,1,0,2,3,[4,5,6,7],
		     [1,2,2,2],[qw/ a b c d/],"time","value",
		     "Test Strip Chart"
					    );

isa_ok($strip, "Graphics::PLplot::StripChart");

my $x = 0.0;
for my $i (0..50) {
  $x += 0.25;
  $strip->plstripa( 0, $x, (2.5 + rand(0.5)));
  $strip->plstripa( 1, $x, (1.5 + rand(0.5)));
  $strip->plstripa( 2, $x, (2.0 + rand(0.5)));
  $strip->plstripa( 3, $x, (3.5 + rand(0.5)));
  select(undef,undef,undef,0.25);

}

# end immediately
plspause(0);
plend();

print "# Ending \n";

exit;
