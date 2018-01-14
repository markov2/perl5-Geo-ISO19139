# This code is part of distribution Geo::ISO19139.  Meta-POD processed with
# OODoc into POD and HTML manual-pages.  See README.md
# Copyright Mark Overmeer.  Licensed under the same terms as Perl itself.

package Geo::ISO19139::2005;
use base 'Geo::GML';

use warnings;
use strict;

use Geo::ISO19139::Util qw/:2005/;

use Log::Report 'geo-iso', syntax => 'SHORT';

use XML::Compile::Cache ();
use XML::Compile::Util  qw/unpack_type pack_type/;

my $xsd = __FILE__;
$xsd    =~ s!/2005+\.pm$!/xsd!;
my @xsd = glob("$xsd/2005/*/*.xsd");

=chapter NAME
Geo::ISO19139::2005 - access to the iso-19139 standard

=chapter SYNOPSIS

 use Geo::ISO19139;
 my $gml = Geo::ISO19139->new('READER', version => '2005');

 # see XML::Compile::Cache on how to use readers and writers
 my $data = $gml->reader("gml:GridCoverage")->($xmlmsg);
 my $xml  = $gml->writer($sometype)->($doc, $perldata);

 # or without help of the cache, XML::Compile::Schema
 my $r    = $gml->compile(READER => $sometype);
 my $data = $r->($xml);

 # overview (huge) on all defined elements
 $gml->printIndex;

=chapter DESCRIPTION
Implementation of the first ISO19139 release, initiated in 2005 but dated
2007-04-17.  The base class implements GML 3.2.1, which belongs to
the spec.  More in M<Geo::ISO19139>

=chapter METHODS

=section Constructors

=c_method new 'READER'|'WRITER'|'RW', %options

=option  version DEFAULT
=default version 2005

=option  gml_version VERSION
=default gml_version 3.2.1

=cut

sub init($)
{   my ($self, $args) = @_;
    $self->{GI9_version} = $args->{version} || '2005';
    $args->{version} = $args->{gml_version} || '3.2.1';

    my $pref = $args->{prefixes} ||= {};
    $pref->{gco} ||= NS_GCO_2005;
    $pref->{gmd} ||= NS_GMD_2005;
    $pref->{gmx} ||= NS_GMX_2005;
    $pref->{gsr} ||= NS_GSR_2005;
    $pref->{gss} ||= NS_GSS_2005;
    $pref->{gts} ||= NS_GTS_2005;

    $self->SUPER::init($args);
    $self->importDefinitions(\@xsd);
    $self;
}

#-------------

=section Accessors

=method gmlVersion
=method version
=cut

sub gmlVersion() {shift->SUPER::version}
sub version()    {shift->{GI9_version}}

1;
