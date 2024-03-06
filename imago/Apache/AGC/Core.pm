package AGC::Core;

# <imago@marinms.com>
# $Id: Core.pm,v 1.1.2.1 2004/03/27 17:04:36 Imago Exp $
# Where the globals and main functions go

require	Exporter;
@ISA = qw(Exporter);
@EXPORT_OK = qw($vars $DBH $SDAT $corename @magazine_types %P %IGC);

use strict;
use AGC::Init qw($vars $DBH $SDAT); #update vars and dbh for pages

use vars qw(@magazine_types @root_tree $corename %P %IGC $vars);

@magazine_types = ('Counter',undef,'Missile','Pack','Shield','Cloak',undef,'Afterburner');
@root_tree = ('Construction','Garrison','Supremecy','Tactical','Expansion','Shipyard');

sub PagesConstruct {
	
	# TODO: html seperation using XHTML XSML etc yadda yadda

	$corename = $vars->{IGC} || 'plus11';
	$corename =~ s/\.igc$//i;
	
	%P = (
		Index		=>	\&AGC::Pages::Index::Entry,
		View		=>	\&AGC::Pages::Index::Viewer,
		Globals		=>	\&AGC::Pages::Globals::View,
		TreeMenu	=>	\&AGC::Pages::Tree::Menu,
		TreeNodes	=>	\&AGC::Pages::Tree::Nodes,
		TreeEmpty	=>	\&AGC::Pages::Tree::Empty,
		TreeHeading =>	\&AGC::Pages::Tree::Heading,
		Part		=>	\&AGC::Pages::Part::View,
		Research	=>	\&AGC::Pages::Research::View,
		Ship		=>	\&AGC::Pages::Ship::View,
		Faction		=>	\&AGC::Pages::Faction::View,
		Station		=>	\&AGC::Pages::Station::View,
		Chaff		=>	\&AGC::Pages::Chaff::View,
		TreasureSet	=>	\&AGC::Pages::TreasureSet::View,
		Projectile	=>	\&AGC::Pages::Projectile::View,
		Mine		=>	\&AGC::Pages::Mine::View,
		Missile		=>	\&AGC::Pages::Missile::View,
		Drone		=>	\&AGC::Pages::Drone::View,
		Error		=>	\&Error,
	); 
	
	return %P;
}

#TODO: Subprocess the decompression, binary C conversion & db. insert
sub StatRecord {

}

#TODO: Subprocess the pICE (use this anymore?) XML conversion & db. insert 
sub CoreRecord {

}

sub Error {return 'wtf';}

1;