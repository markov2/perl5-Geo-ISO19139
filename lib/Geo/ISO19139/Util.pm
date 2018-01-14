# This code is part of distribution Geo::ISO19139.  Meta-POD processed with
# OODoc into POD and HTML manual-pages.  See README.md
# Copyright Mark Overmeer.  Licensed under the same terms as Perl itself.

package Geo::ISO19139::Util;
use base 'Exporter';

use warnings;
use strict;

our @r2005   = qw/NS_GCO_2005 NS_GMD_2005 NS_GMX_2005
  NS_GSR_2005 NS_GSS_2005 NS_GTS_2005 NS_GML_2005/;

our @EXPORT_OK = ( @r2005 );

our %EXPORT_TAGS =
  ( 2005 => \@r2005
  );

=chapter NAME
Geo::ISO19139::Util - iso-19139 useful constants

=chapter SYNOPSIS
=chapter DESCRIPTION
=chapter FUNCTIONS

=section Constants

=subsection Export Tags :2005
=cut

use constant NS_GML_2005 => 'http://www.opengis.net/gml/3.2';
use constant NS_GCO_2005 => 'http://www.isotc211.org/2005/gco';
use constant NS_GMD_2005 => 'http://www.isotc211.org/2005/gmd';
use constant NS_GMX_2005 => 'http://www.isotc211.org/2005/gmx';
use constant NS_GSR_2005 => 'http://www.isotc211.org/2005/gsr';
use constant NS_GSS_2005 => 'http://www.isotc211.org/2005/gss';
use constant NS_GTS_2005 => 'http://www.isotc211.org/2005/gts';

1;
