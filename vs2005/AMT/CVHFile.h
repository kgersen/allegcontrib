/*
	CVHFile.h - Allegiance cvh files API header
	Copyright (C) Kirth Gersen, 2001-2002.  All rights reserved.

	v 0.94
*/
#pragma once
#define MAXCPOINTS 100

#define MAX(x,y) ((x)>(y)?(x):(y))

typedef struct SCVHHeader
{
	float biggest; // = max(max_x,max_y,max_z)/scale
	float max_x;
	float max_y;
	float max_z;
	float scale; // set to 1.0 when exporting :) 
} CVHHeader;

typedef struct SCVHPoint
{
	float x,y,z;
	int nb_connected_points;
	int connected_points[MAXCPOINTS];
} CVHPoint ;
typedef CVHPoint *PtrPoint;

typedef struct SCVHObject
{
	int points;
	int vertices;
	float cx,cy,cz; // center 
	CArray<PtrPoint,PtrPoint> Points;
} CVHObject;

typedef CVHObject *PtrObject;

typedef struct SCVHNamedPoint
{
	CString name;
	float x1,y1,z1;
	float x2,y2,z2;
} CVHNamedPoint;
typedef CVHNamedPoint *PtrNamedPoint;
class CCVHFile
{
public:
	CCVHFile(void);
	~CCVHFile(void);
	bool ReadFromFile(CString sFileName);
	bool SaveToFile(CString sFileName);
	bool SaveToXFile(CString sFileName, CString sName);
	void ComputeCenters(void);
	void ComputeHeader(void);
	void ComputeHeader(float mx, float my, float mz);
	void AddConnectedPoints(PtrPoint pp,int i1, int i2);

public:
	CVHHeader header;
	int nbobjects;
	CArray<PtrObject,PtrObject> Objects;
	CArray<PtrNamedPoint,PtrNamedPoint> NamedPoints;
};
