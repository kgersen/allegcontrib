#$Id: igc2xml.pl,v 1.1.2.1 2004/05/12 22:10:12 Imago Exp $

use File::Basename;
use Alleg::Core;
use XML::Dumper;

#pass in a path to igc file as command-line parameter

igc2xml($ARGV[0]);

#done, a (g-zipped) xml file awaits in the same directory as the igc file


sub igc2xml {
	my ($base,$path,$type) = fileparse(shift,'.igc');

	open coreFH, $path.$base.$type;
	binmode coreFH;
	my $core = Alleg::Core->new_from_fh(*coreFH);
	close coreFH;

	my %IGC = ();

	my $globalobj = \%{$core->{Globals}};
	my %global_kv = %{$globalobj};
	$IGC{Globals} = \%global_kv;

	foreach my $type (@Alleg::Core::CORE_TYPES) {
		my $cntr = 0;
		if ( @{ $core->{$type} } ) {
			my $obj = $core->{$type}[0];
			my %default_kv = $obj->get_defaults();
			while (my ($key, $value) = each %default_kv) {delete $default_kv{$key} if $value !~ /\w/;}
			my @default_keys = keys %default_kv;
			$IGC{$type}{Defaults} = \%default_kv if scalar(@default_keys);
		}
		while (defined $core->{$type}[$cntr]) {
			my %kv_hash = ();
			my $obj = $core->{$type}[$cntr];
			@kv_hash{$obj->pack_order} = @{ $obj }{$obj->pack_order};
			if (exists $kv_hash{techtree}) {
				my @pre = $obj->get_pre();
				my @def = $obj->get_def();
				$kv_hash{PRE} = \@pre;
				$kv_hash{DEF} = \@def;
				delete $kv_hash{techtree};
			}
			while (my ($key, $value) = each %kv_hash) {delete $kv_hash{$key} if $value !~ /\w/;}

			if ($type eq 'Part') {
				my $part_typename = $Alleg::Constants::PART_TYPES[$obj->param('type')];
				$part_typename =~ s/AGCEquipmentType_//;
				$IGC{$type}{$part_typename}{$cntr} = \%kv_hash;

			} elsif ($type eq 'TreasureSet') {
				$kv_hash{name} = &CurtIsABitch($kv_hash{name});
				$IGC{$type}{$cntr} = \%kv_hash;
				my $total_chances = $obj->param('count');
				for (my $chance=0; $chance < $total_chances; $chance++) {
					my %Chance = %{$obj->{_CHANCES}[$chance]};
					my $chancekey = "CHANCE_".$chance;
					$IGC{$type}{$cntr}{$chancekey} = \%Chance;
				}

			} else {
				$IGC{$type}{$cntr} = \%kv_hash;
			}
			$cntr++;
		}
	}

	my $corename = $base; $corename =~ s/\.igc//i;
	$corename =~ s/^.*\///g;
	$IGC{CORENAME} = $corename;
	my $xmlfile = $corename.'.xml.gz';
	pl2xml(\%IGC, $path.$xmlfile);
}

sub CurtIsABitch { # Just kidding, have my babies.
	my $txt = shift;
	my $return = '';
	foreach my $char (split(//,$txt)) {
		my $charid = unpack("C",$char);
		if ($charid > 31 and $charid < 128) {
			$return .= $char;
		}
	}
	return $return;
}