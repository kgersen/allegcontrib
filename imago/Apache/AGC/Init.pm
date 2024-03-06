package AGC::Init;

# <imago@marinms.com>
# $Id: Init.pm,v 1.1.2.1 2004/03/27 17:04:36 Imago Exp $
# Always use DBI :0, Offers a Session and CGI for browser requests.

require	Exporter;
@ISA = qw(Exporter);
@EXPORT_OK = qw($vars $FDAT $SDAT $BROWSER $DBH);

use strict;
use AGC::Core qw($vars $DBH $SDAT %P); # For Page output we dont bring in CGI!
use AGC::Core::Browser;
use AGC::Core::Session;

use vars qw($vars $DBH $FDAT $SDAT $BROWSER %P);

sub handler {
	$DBH ||= DBI->connect('dbi:mysql:AGC', "AGC", undef);
	Apache->request(shift);
}

# accepts nothing 
# returns nothing on valid session, http header(s) if new session needed, 
# or a debug message if it failed
#
sub browser_request {

	$FDAT = CGI->new;
	
	# Verify/Create session
	my $setcookie = '';
	my $dbgMismatch = '';
	$BROWSER = new AGC::Core::Browser($FDAT->user_agent) if (!$BROWSER);
	
	if ($BROWSER->user_agent ne $FDAT->user_agent) {
		$BROWSER = new AGC::Core::Browser($FDAT->user_agent);
		$SDAT = new AGC::Core::Session if (!$SDAT->get());
		$setcookie = $SDAT->set();
		$dbgMismatch = "Browser forceed session Init!";
	}
	
	if (!$SDAT->get()) {
		$setcookie = $SDAT->set();
		$dbgMismatch = "Session Init";
	}
	
	if($SDAT->ua ne $BROWSER->user_agent) {
		$dbgMismatch = "WTF session Init!";
		$setcookie = $dbgMismatch;
		return undef; #failed
	}

	#TODO:  perform some AuthDBI routine, set admin bit
	
	# Setup form variables (w/o mucking params)
	$vars = $FDAT->Vars;
	
	# Load the page lookup if we are taking that route 
	%P = &AGC::Core::PagesConstruct() if (!$vars->{P});
	
	return $setcookie;
}

# accepts nothing 
# returns nothing on valid request, 
# something if it failed
#
sub allstats_request {
	$FDAT = CGI->new;
	
	#TODO: Handle a ProcessStats request
		  #A cron request to re-build/prune statistics & static pages
	
	#TODO: Handle a HaveGameStats request
		  #Fail method used the allstats to Record missed Game stats
	
	#TODO: If new mission stats record request  
		  #Pull in special headers
		  #Check Authenticity
		  #Return allstats WriteStatDumps response /w auth challenge
		  	
	#TODO: If proc. mission stats request
		  #Verify challenge
		  #AGC::Core::StatsRecord
}

1;

__END__
