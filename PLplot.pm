package Graphics::PLPLOT;

=head1 NAME

Graphics::PLPLOT - Perl interface to the PLPLOT plotting library

=head1 SYNOPSIS

  use Graphics::Plot;

  plinit();


=head1 DESCRIPTION


=cut

use vars qw/ $VERSION /;
$VERSION = '0.01';

require DynaLoader;
use base qw/ DynaLoader /;

bootstrap Graphics::PLPLOT $VERSION;


=head1 AUTHOR

Tim Jenness E<lt>t.jenness@jach.hawaii.eduE<gt>

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

=cut

1;
