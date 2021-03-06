# This code is part of distribution Geo::ISO19139.  Meta-POD processed with
# OODoc into POD and HTML manual-pages.  See README.md
# Copyright Mark Overmeer.  Licensed under the same terms as Perl itself.

package Geo::ISO19139;

use warnings;
use strict;

use Log::Report 'geo-iso', syntax => 'SHORT';
use XML::Compile::Cache ();
use XML::Compile::Util  qw/unpack_type pack_type/;

my %version2pkg =
 ( 2005 => 'Geo::ISO19139::2005'
 );

=chapter NAME
Geo::ISO19139 - access iso-19139 structures

=chapter SYNOPSIS
 # See Geo::ISO19139:2005

=chapter DESCRIPTION

ISO TC/211 (Geographic Information/Geomatics) is responsible for
the ISO geographic information series of standards, in coordination
with OpenGIS Consortium (OGC) and many other organisations and
bodies.  See L<http://www.isotc211.org>

This distribution contains all definitions of ISO-19139: "Metadata -
Implementation specification", which is the specification of many
ISO-191xx standards.  GML (ISO19136) which is released seperately
in package M<Geo::GML>, because it has also many pre-ISO versions.

In the future, it would be nice to extend this module into more of an
application base.  On the moment, it is just a schema container, which
enables you to read and write XML which use these schemas.

Name-spaces and Components:

  GMD ISO19115 Metadata
  GSS ISO19107 Spatial Schema, realized by GML
  GTS ISO19108 Temporal Schema
  GSR ISO19111 Spatial Reference Schema, realized by GML
  GCO ISO19118 Encoding, basic types
  GCO ISO19136 GML
  GMX Extended Geographic Metadata

B<WARNING:> I have not used this module for many years.  It probably
works (or is close to working).  You will get support.

=chapter METHODS

=section Constructors
=c_method new 'READER'|'WRITER'|'RW', %options

This C<new()> method will instantiate a M<Geo::ISO19139::2005> object,
when called with the required "version => 2005" option.  Other OPTIONS
are passed to M<Geo::ISO19139::2005::new()>.

=requires version VERSION
Only used when the object is created directly from this base-class.  It
determines which GML syntax is to be used.  Can be a VERSION like "2005"

=cut

sub new(@)
{   my $class = shift;
    my ($direction, %args) = @_;

    # having a default here cannot be maintained over the years.
    my $version = delete $args{version}
        or error __x"an explicit version is required\n";

    my $pkg     = $version2pkg{$version}
        or error __x"no implementation for version '{version}'"
             , version => $version;

    eval "require $pkg";
    $@ and die $@;

    $pkg->new($direction, %args);
}

1;
