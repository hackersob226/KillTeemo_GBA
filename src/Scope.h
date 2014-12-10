
//{{BLOCK(Scope)

//======================================================================
//
//	Scope, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 35 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2240 + 2048 = 4800
//
//	Time-stamp: 2014-11-28, 21:02:06
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SCOPE_H
#define GRIT_SCOPE_H

#define ScopeTilesLen 2240
extern const unsigned short ScopeTiles[1120];

#define ScopeMapLen 2048
extern const unsigned short ScopeMap[1024];

#define ScopePalLen 512
extern const unsigned short ScopePal[256];

#endif // GRIT_SCOPE_H

//}}BLOCK(Scope)
