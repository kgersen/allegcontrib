#pragma once
#include "mapstruct.h"

#define ROCKTPLMAX 3
const CString RockTplNames[ROCKTPLMAX] = {"Asteroid","Helium","Tech rocks"};
const unsigned short RockTplTypes[ROCKTPLMAX] = 
{	IGCROCK_IS_ASTERIOD,
	IGCROCK_IS_HELIUM,
	IGCROCK_IS_URANIUM|IGCROCK_IS_SILICON|IGCROCK_IS_CARBON|IGCROCK_IS_THORIUM
};
const unsigned short RockTplRadiusMin[ROCKTPLMAX] = {100,200,200};
const unsigned short RockTplRadiusMax[ROCKTPLMAX] = {300,800,800};
const float RockTplHPFact[ROCKTPLMAX] = {5,5,5};
const float RockTplSigFact[ROCKTPLMAX] = {.1f,.1f,.1f};
class CRockTpl
{
public:
	CRockTpl(void);
	CRockTpl & operator=( CRockTpl & );
	CString Names[ROCKTPLMAX];
	unsigned short Types[ROCKTPLMAX];
	float sig[ROCKTPLMAX];
	float hitpoints[ROCKTPLMAX];
	BOOL sig_size[ROCKTPLMAX];
	BOOL hp_size[ROCKTPLMAX];
	float sig_fact[ROCKTPLMAX];
	float hitpoints_fact[ROCKTPLMAX];
	unsigned short radius[ROCKTPLMAX];
	BOOL random_radius[ROCKTPLMAX];
	int radius_min[ROCKTPLMAX];
	int radius_max[ROCKTPLMAX];
	BOOL radius_Included[ROCKTPLMAX];
	BOOL hp_Included[ROCKTPLMAX];
	BOOL sig_Included[ROCKTPLMAX];
	~CRockTpl(void);
	float GenSig(int,unsigned short);
	float GenHP(int,unsigned short);
	unsigned short GenRadius(int);
};
