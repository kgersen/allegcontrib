#!/usr/bin/perl

# <imago@marinms.com>
# $Id: corefiles.pl,v 1.1.2.1 2004/03/27 17:04:37 Imago Exp $
# A script to make a corefiles.txt file list of core dependant artwork files 

use strict;
use Alleg::Core; 

my $artworkpath = 'C:/alleg/AllegianceFree/artwork/';
my $corefile = 'plus10.igc';

# make pICE object
open coreFH, $artworkpath.$corefile; 
binmode coreFH;
my $core = Alleg::Core->new_from_fh(*coreFH); 
close coreFH; 

# get all Key/Value pairs from the core object
my $cntr = 1; my %fields = ();
foreach my $type (@Alleg::Core::CORE_TYPES) {
	while (defined $core->{$type}[$cntr]) {
   		my %kv_hash = (); 
		my $obj = $core->{$type}[$cntr]; 
		@kv_hash{$obj->pack_order} = @{ $obj }{$obj->pack_order}; 
		$fields{$cntr} = \%kv_hash;
		$cntr++;
    } 
} 

# put unique psuedo-file names into an array
my @values = [];
foreach my $num (keys %fields) {
	my %kv_hash = %{$fields{$num}};
	foreach my $key (keys %kv_hash) {
		if ($key eq 'model' || $key =~ /icon/ || $key =~ /bmp/ || 
			$key eq 'obj' || $key eq 'loadout_model' || $key =~ /file/) {
			
			my $value = $kv_hash{$key};
			push @values, $value if ((!grep {$_ eq $value} @values) && ($value ne ''));
			}
	}
}

# generate paths and verify file existance
# :-)  I don't know how to do the .wav files, they don't give names, just numbers?
# help...
my @files = [];
foreach my $filename (@values) {
	my $mdl = $artworkpath.$filename.'.mdl';
	my $cvh = $artworkpath.$filename.'.cvh';
	my $mdlbmp = $artworkpath.'i'.$filename.'bmp.mdl';
	my $mapicon = $artworkpath.'l'.$filename.'bmp.mdl';
	my $loadouticon = $artworkpath.$filename.'bmp.mdl';
	push @files, $mdl if (-e $mdl);
	push @files, $cvh if (-e $cvh);
	push @files, $mdlbmp if (-e $mdlbmp);
	push @files, $mapicon if (-e $mapicon);
	push @files, $loadouticon if (-e $loadouticon);
}

# make the list
open listFH, '>corefiles.txt';
@files = sort @files;
print listFH $artworkpath.$corefile."\n\n";
foreach my $file (@files) {
	print listFH "$file\n" if $file !~ /ARRAY/;
}
close listFH;
exit(0); 
