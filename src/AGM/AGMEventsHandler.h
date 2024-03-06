#pragma once

#define AGM_MAX_STAT_KEYS 20
const CString StatKeys[AGM_MAX_STAT_KEYS] = {
"Artifacts",
"Assists",
"AsteroidsSpotted",
"BaseCaptures",
"BaseKills",
"BuilderKills",
"CarrierKills",
"CombatRating",
"Deaths",
"Ejections",
"Flags",
"Kills",
"LayerKills",
"MinerKills",
"PilotBaseCaptures",
"PilotBaseKills",
"PlayerKills",
"Rescues",
"TechsRecovered",
"WarpsSpotted"
};

#define AGM_MAX_WINGS 10
const CString WingsNames[AGM_MAX_WINGS] = {
"command",
"attack",
"defend",
"escort",
"search",
"alpha",
"bravo",
"charlie",
"delta",
"echo"
};
// abstract class 
class AGMEventsHandler
{
public:
	AGMEventsHandler(void);
	~AGMEventsHandler(void);
	float * GetPlayerStats(IAdminUser * iuser);
	IAdminUser * GetUser(IAdminGame *, AGCUniqueID userID);
	IAdminGame * GetGame(IAdminServer *iserver, AGCGameID gameid);
	virtual void OnAGCEvent(IAGCEvent * pEvent) = 0;
};
