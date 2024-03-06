// ==========================================================
// FreeImage Plugin Interface
//
// Design and implementation by
// - Floris van den Berg (flvdberg@wxs.nl)
// - Rui Lopes (ruiglopes@yahoo.com)
//
// This file is part of FreeImage 2
//
// COVERED CODE IS PROVIDED UNDER THIS LICENSE ON AN "AS IS" BASIS, WITHOUT WARRANTY
// OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, WITHOUT LIMITATION, WARRANTIES
// THAT THE COVERED CODE IS FREE OF DEFECTS, MERCHANTABLE, FIT FOR A PARTICULAR PURPOSE
// OR NON-INFRINGING. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE COVERED
// CODE IS WITH YOU. SHOULD ANY COVERED CODE PROVE DEFECTIVE IN ANY RESPECT, YOU (NOT
// THE INITIAL DEVELOPER OR ANY OTHER CONTRIBUTOR) ASSUME THE COST OF ANY NECESSARY
// SERVICING, REPAIR OR CORRECTION. THIS DISCLAIMER OF WARRANTY CONSTITUTES AN ESSENTIAL
// PART OF THIS LICENSE. NO USE OF ANY COVERED CODE IS AUTHORIZED HEREUNDER EXCEPT UNDER
// THIS DISCLAIMER.
//
// Use at your own risk!
// ==========================================================

#pragma warning (disable : 4786)

#ifndef PLUGIN_H
#define PLUGIN_H

#ifndef _MAP_
#include <map>
#endif

#ifndef FREEIMAGE_H
#include "FreeImage.h"
#endif

// ==========================================================

struct Plugin;

// =====================================================================
//  Plugin Node
// =====================================================================

FI_STRUCT (PluginNode) {
	int m_id;
	void *m_instance;
	Plugin *m_plugin;
	PluginNode *m_next;
	BOOL m_enabled;

	const char *m_format;
	const char *m_description;
	const char *m_extension;
	const char *m_regexpr;
};

// =====================================================================
//  Internal Plugin List
// =====================================================================

class PluginList {
public :
	PluginList();
	~PluginList();

	FREE_IMAGE_FORMAT AddNode(FI_InitProc proc, void *instance = NULL, const char *format = 0, const char *description = 0, const char *extension = 0, const char *regexpr = 0);
	PluginNode *FindNodeFromFormat(const char *format);
	PluginNode *FindNodeFromMime(const char *mime);
	PluginNode *FindNodeFromFIF(int node_id);

	int Size() const;
	BOOL IsEmpty() const;

private :
	std::map<int, PluginNode *> m_plugin_map;
	int m_node_count;
};

// ==========================================================
//   Plugin Initialisation Callback
// ==========================================================

void DLL_CALLCONV FreeImage_OutputMessage(int fif, const char *message, ...);

// =====================================================================
// Reimplementation of stricmp (it is not supported on some systems)
// =====================================================================

int FreeImage_stricmp(const char *s1, const char *s2);
int FreeImage_GetFreeImageHeaderSize(); // bitmapaccess.cpp

// ==========================================================
//   Internal functions
// ==========================================================

extern "C" {
	BOOL DLL_CALLCONV FreeImage_Validate(FREE_IMAGE_FORMAT fif, FreeImageIO *io, fi_handle handle);
    void * DLL_CALLCONV FreeImage_Open(PluginNode *node, FreeImageIO *io, fi_handle handle, BOOL open_for_reading);
    void DLL_CALLCONV FreeImage_Close(PluginNode *node, FreeImageIO *io, fi_handle handle, void *data); // plugin.cpp
	FreeImage *FreeImage_GetFreeImageStruct();
    PluginList * DLL_CALLCONV FreeImage_GetPluginList(); // plugin.cpp
    int * DLL_CALLCONV FreeImage_GetExtraDataPointer(FIBITMAP *bitmap, int entry); // bitmapaccess.cpp
}

// ==========================================================
//   Internal plugins
// ==========================================================

void DLL_CALLCONV InitBMP(Plugin *plugin, int format_id);
void DLL_CALLCONV InitCUT(Plugin *plugin, int format_id);
void DLL_CALLCONV InitICO(Plugin *plugin, int format_id);
void DLL_CALLCONV InitIFF(Plugin *plugin, int format_id);
void DLL_CALLCONV InitJPEG(Plugin *plugin, int format_id);
void DLL_CALLCONV InitKOALA(Plugin *plugin, int format_id);
void DLL_CALLCONV InitLBM(Plugin *plugin, int format_id);
void DLL_CALLCONV InitMNG(Plugin *plugin, int format_id);
void DLL_CALLCONV InitPCD(Plugin *plugin, int format_id);
void DLL_CALLCONV InitPCX(Plugin *plugin, int format_id);
void DLL_CALLCONV InitPNG(Plugin *plugin, int format_id);
void DLL_CALLCONV InitPNM(Plugin *plugin, int format_id);
void DLL_CALLCONV InitPSD(Plugin *plugin, int format_id);
void DLL_CALLCONV InitRAS(Plugin *plugin, int format_id);
void DLL_CALLCONV InitTARGA(Plugin *plugin, int format_id);
void DLL_CALLCONV InitTIFF(Plugin *plugin, int format_id);
void DLL_CALLCONV InitWBMP(Plugin *plugin, int format_id);

#endif //!PLUGIN_H