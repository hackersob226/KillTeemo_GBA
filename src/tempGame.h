
//{{BLOCK(tempGame)

//======================================================================
//
//	tempGame, 512x512@8, 
//	+ palette 256 entries, not compressed
//	+ 41 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 2624 + 8192 = 11328
//
//	Time-stamp: 2014-11-18, 16:54:04
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TEMPGAME_H
#define GRIT_TEMPGAME_H

#define tempGameTilesLen 2624
extern const unsigned short tempGameTiles[1312];

#define tempGameMapLen 8192
extern const unsigned short tempGameMap[4096];

#define tempGamePalLen 512
extern const unsigned short tempGamePal[256];

#endif // GRIT_TEMPGAME_H

//}}BLOCK(tempGame)
