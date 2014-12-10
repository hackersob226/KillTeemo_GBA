
//{{BLOCK(Bg)

//======================================================================
//
//	Bg, 512x512@8, 
//	+ palette 256 entries, not compressed
//	+ 439 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 28096 + 8192 = 36800
//
//	Time-stamp: 2014-11-28, 21:24:53
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG_H
#define GRIT_BG_H

#define BgTilesLen 28096
extern const unsigned short BgTiles[14048];

#define BgMapLen 8192
extern const unsigned short BgMap[4096];

#define BgPalLen 512
extern const unsigned short BgPal[256];

#endif // GRIT_BG_H

//}}BLOCK(Bg)
