#!perl

# Perl version of the PLPLOT C x04c.c example

use strict;
use Test::More tests => 1;
use Math::Trig qw/ pi /;
use POSIX qw/ log10 /;

require_ok("Graphics::PLPLOT");

print "# Version: ". &Graphics::PLPLOT::plgver() ."\n";

Graphics::PLPLOT::plsdev( "xwin" );
Graphics::PLPLOT::plinit();
Graphics::PLPLOT::plfont(2);

&plot1( 0 );
&plot1( 1 );

Graphics::PLPLOT::plend();

print "# Ending \n";

exit;

sub plot1 {
  my $type = shift;

  Graphics::PLPLOT::pladv( 0 );

  # Set up data for log plot
  my $f0 = 1.0;
  my (@freql,@ampl,@phase);
  for my $i (0..100) {
    $freql[$i] = -2.0 + $i / 20.0;
    my $freq = 10 ** $freql[$i];
    $ampl[$i] = 20 * log10( 1/ sqrt(1 + ($freq/$f0)**2 ));
    $phase[$i] = -(180/pi) * atan2($freq,$f0);
  }

  Graphics::PLPLOT::plvpor(0.15,0.85,0.1,0.9);
  Graphics::PLPLOT::plwind(-2,3,-80,0);

  # Try different axis and labelling styles
  Graphics::PLPLOT::plcol0(1);
  if ($type == 0) {
    Graphics::PLPLOT::plbox("bclnst",0,0,"bnstv",0,0);
  } else {
    Graphics::PLPLOT::plbox("bcfghlnst",0,0,"bcghnstv",0,0);
  }

  # Plot ampl vs freq
  Graphics::PLPLOT::plcol0(2);
  Graphics::PLPLOT::plline(\@freql, \@ampl);
  Graphics::PLPLOT::plcol0(1);
  Graphics::PLPLOT::plptex(1.6,-30,1,-20,0.5,"-20 dB/decade");

  # Put labels on
  Graphics::PLPLOT::plcol0(1);
  Graphics::PLPLOT::plmtex("b",3.2,0.5,0.5,"Frequency");
  Graphics::PLPLOT::plmtex("t",2,0.5,0.5,"Single Pole Low-Pass Filter");
  Graphics::PLPLOT::plcol0(2);
  Graphics::PLPLOT::plmtex("l",5,0.5,0.5,"Amplitude (dB)");

  # For the gridless case, put phase vs freq on same plot
  if ($type == 0) {
    Graphics::PLPLOT::plcol0(1);
    Graphics::PLPLOT::plwind(-2,3,-100,0);
    Graphics::PLPLOT::plbox("",0,0,"cmstv",30,3);
    Graphics::PLPLOT::plcol0(3);
    Graphics::PLPLOT::plline(\@freql,\@phase);
    Graphics::PLPLOT::plcol0(3);
    Graphics::PLPLOT::plmtex("r",5,0.5,0.5,"Phase shift (degrees)");
  }

}
