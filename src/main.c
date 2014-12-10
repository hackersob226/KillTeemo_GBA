/*
I am making a game where the goal of the game is to 
shoot the enemy (Teemo) that appears from the bushes.

Right now I have a dummy sprite for the enemy (a face) and 
a scope which is able to kill the dummy sprite by 
aiming and clicking R. The background will be fixed but will
look a lot better as I find suitable art replacements.
*/
#include <stdio.h>
#include <stdlib.h>
#include "myLib.h"
#include "text.h"
#include "Sprites.h"
#include "Scope.h"
#include "CharSelect.h"
#include "GunShot.h"
#include "BgMusic.h"
#include "TeemoDeath.h"
#include "Defeat.h"
#include "Victory.h"
#include "TeemoShot.h"
#include "CaitlynShot.h"
#include "TeemoMove.h"
#include "Bg.h"
#include "Splash.h"
#include "Help.h"
#include "Win.h"
#include "Lose.h"
#include "Pause.h"

#define ROWMASK 0xFF
#define COLMASK 0x1FF
#define DEAD 15
#define ALIVE 7
#define SHOOTING 0
#define NOTSHOOTING 1 

unsigned int buttons;
unsigned int oldButtons;

enum{SPLASH, INSTRUCT, GAME, PAUSE, WIN, LOSE};

typedef struct  
{
	int row;
	int col;
	int bigRow;
	int bigCol;
	int rdel;
	int cdel;
	int width;
	int height;
	int aniState;
	int isDead;
	int deathCounter;
} SPRITE;

typedef struct 
{
	int row;
	int col;
	int bigRow;
	int bigCol;
} BUSH;

typedef struct 
{
	int row;
	int col;
	int bigRow;
	int bigCol;
} BORINGBUSH;

SPRITE enemies;
BUSH bushes[5];
BORINGBUSH boringBushes[5];
OBJ_ATTR shadowOAM[128];

int animationCounter = 0;
int deathCounter;
int bloodCounter;
int score;
int scoreTenth;
int actualScore;
int health;
int currBush;
int shootingFlag = NOTSHOOTING;
int cheatFlag = 1;
int state;
int hOff;
int vOff;
int level;
int enemyFreq;
int levelFlag = 0;
int soundCounter;
int shotFlag;
int enemyBloodCounter = 0;
int scopeBigRow;
int scopeBigCol;
int oldScopeBigRow;
int oldScopeBigCol;
int whichBloodSprite;
int flyingBloodFlag;
int bloodVelocity = 1;
int deathAnimationCounter = 0;
int lockFlag;
int recoilCount = 1;
int levelSpriteFlag;
int levelUpVelocity;

void splash();
void instruct();
void game();
void pause();
void win();
void lose();
void hideSprites();
void initialize();
void updateOAM();
void checkShot();
void checkDead();
void respawn();
void didHeShoot();
void didHeMove();
void checkLevel();

int main()
{
	state = SPLASH;
	buttons = BUTTONS;

	setupInterrupts();
	setupSounds();
    playSoundA(CharSelect,CHARSELECTLEN,CHARSELECTFREQ);

	while(1) {
        oldButtons = buttons;
		buttons = BUTTONS;

		switch(state)
		{
			case SPLASH:
				splash();
				break;
			case INSTRUCT:
				instruct();
				break;
			case GAME:
				game();
				break;
			case PAUSE:
				pause();
				break;
			case WIN:
				win();
				break;
			case LOSE: 
				lose();
				break;
		}
	}
	return 0;
}

void splash()
{
	REG_DISPCTL = MODE4 | BG2_ENABLE;
	initialize();

    loadPalette(SplashPal);
    drawBackgroundImage4(SplashBitmap);
	if(BUTTON_PRESSED(BUTTON_START)) {
		state = GAME;
		waitForVblank();
		fillScreen4(0);

	}
	if(BUTTON_PRESSED(BUTTON_SELECT)) {
		state = INSTRUCT;
		waitForVblank();
		fillScreen4(0);
	}
}

void instruct()
{
	drawBackgroundImage4(HelpBitmap);

		if(BUTTON_PRESSED(BUTTON_START)) {
			state = GAME;
			waitForVblank();
			fillScreen4(0);
		}
		if(BUTTON_PRESSED(BUTTON_SELECT)) {
			state = SPLASH;
			waitForVblank();
			fillScreen3(0);
		}
	
}

void game() 
{
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE0 | SBB(31) | CBB(0) | COLOR256 | BG_PRIO1;
	REG_BG1CNT = BG_SIZE3 | SBB(22) | CBB(1) | COLOR256 | BG_PRIO3;
    playSoundA(BgMusic,BGMUSICLEN,BGMUSICFREQ);

    loadPalette(BgPal); 
   	DMANow(3, ScopeTiles, &CHARBLOCKBASE[0], ScopeTilesLen/2);  
	DMANow(3, ScopeMap, &SCREENBLOCKBASE[31], 1024);
	DMANow(3, BgTiles, &CHARBLOCKBASE[1], BgTilesLen/2);  
	DMANow(3, BgMap, &SCREENBLOCKBASE[22], 4096);

	DMANow(3, SpritesTiles, &CHARBLOCKBASE[4], SpritesTilesLen/2);
	DMANow(3, SpritesPal, SPRITE_PALETTE, 256);

	REG_BLDMOD = (1 << 4) | (1 << 8);
	REG_COLEV = (8) + (8 << 8);

	hideSprites();

	while(1)
	{
        oldButtons = buttons;
		buttons = BUTTONS;
		checkDead();
		respawn();
		didHeShoot();
		didHeMove();
		checkLevel();

		for(int c = 0; c < 5; c++) {
			bushes[c].row = bushes[c].bigRow - vOff;
			bushes[c].col = bushes[c].bigCol - hOff;
			boringBushes[c].row = boringBushes[c].bigRow - vOff;
			boringBushes[c].col = boringBushes[c].bigCol - hOff;
		}
		enemies.row = bushes[currBush].bigRow - 25 - vOff;
		enemies.col = bushes[currBush].bigCol + 13 - hOff;
		enemies.bigRow = enemies.row + vOff;
		enemies.bigCol = enemies.col + hOff;

		scopeBigRow = 80 + vOff;
		scopeBigCol = 120 + hOff;

		//animation
		animationCounter++;
		if(animationCounter % 5 == 0) {
			if(enemies.isDead == ALIVE) {
				enemies.aniState += 4;
				if(enemies.aniState > 29) {
					enemies.aniState = 0;
				}
			}	
		}
		if(animationCounter > 10000) {
			animationCounter = 0;
		}

		if(enemies.isDead == DEAD) {
			deathAnimationCounter++;
			if(deathAnimationCounter % 10 == 0) {
				enemies.aniState += 4;
			}
			if(enemies.aniState == 12) {
				deathAnimationCounter = 0;
			}
		} 

		if(BUTTON_PRESSED(BUTTON_START)) {
			state = PAUSE;
			pauseSound();
			return;
		}
		if(BUTTON_PRESSED(BUTTON_SELECT)) {
			if(cheatFlag == 0) {
				cheatFlag = 1;
			} else {
				cheatFlag = 0;
			}
		}
		if(cheatFlag == 0) {
			if(BUTTON_PRESSED(BUTTON_UP) || BUTTON_PRESSED(BUTTON_DOWN) ||
				BUTTON_PRESSED(BUTTON_RIGHT) || BUTTON_PRESSED(BUTTON_LEFT)) {
				vOff = enemies.bigRow - 52;
				hOff = enemies.bigCol - 104;
			}
		} else {
			if(lockFlag == 0) {
				if((vOff - 5) > 0) {
					vOff = vOff - 5;
				}

				lockFlag = 1;
			} else {
				if(BUTTON_HELD(BUTTON_UP)) {
					if(vOff > 0) {	
						vOff--;
					}	
				}
				if(BUTTON_HELD(BUTTON_DOWN)) {
					if(vOff<96) {	
						vOff++;
					}
				}
				if(BUTTON_HELD(BUTTON_RIGHT)) {
					if(hOff < 272) {
						hOff++;
					}
				}
				if(BUTTON_HELD(BUTTON_LEFT)) {
					if(hOff > 0) {
						hOff--;
					}
				}
			}
		}

		if(BUTTON_PRESSED(BUTTON_B)) {
			checkShot();
			lockFlag = 0;
		}
		if(actualScore > 43) {
			state = WIN;
			return;
		}
		if(health > 4) {
			state = LOSE;
			return;
		}

		REG_BG1HOFS = hOff;
		REG_BG1VOFS = vOff;
		updateOAM();
		
		DMANow(3, shadowOAM, OAM, 512);
		waitForVblank();
	}
}

void initialize()
{
	vOff = 0;
	hOff = 96;

	bushes[0].bigRow = 102;
	bushes[0].bigCol = 280;

	bushes[1].bigRow = 120;
	bushes[1].bigCol = 184;

	bushes[2].bigRow = 165;
	bushes[2].bigCol = 280;

	bushes[3].bigRow = 160;
	bushes[3].bigCol = 120;

	bushes[4].bigRow = 170;
	bushes[4].bigCol = 360;

	boringBushes[0].bigRow = 100;
	boringBushes[0].bigCol = 118;
	boringBushes[1].bigRow = 140;
	boringBushes[1].bigCol = 420;
	boringBushes[2].bigRow = 95;
	boringBushes[2].bigCol = 360;
	boringBushes[3].bigRow = 190;
	boringBushes[3].bigCol = 195;
	boringBushes[4].bigRow = 140;
	boringBushes[4].bigCol = 54;

 
	currBush = rand()%5;
	enemies.row = bushes[currBush].bigRow - 25 - vOff;
	enemies.col = bushes[currBush].bigCol + 13 - hOff;
	enemies.width = 16;
	enemies.height = 16;
	enemies.rdel = 1;
	enemies.cdel = 1;
	enemies.aniState = 0;
	enemies.isDead = ALIVE;
	enemies.deathCounter = 0;

	health = 0;
	score = 0;
	scoreTenth = 0;
	actualScore = 0;
	level = 1;
	enemyFreq = 1300;
	//Yay flags.
	cheatFlag = 1;
	shotFlag = 1;
	flyingBloodFlag = 1;
	lockFlag = 1;
	levelSpriteFlag = 1;
	shootingFlag = NOTSHOOTING;
}

void checkShot(){
	if(80 > enemies.row + 8 && 120 > enemies.col 
		&& 80 < enemies.row + 32 && 120 < enemies.col + 32
		&& enemies.isDead == ALIVE) {
		enemies.aniState = 0;
		enemies.isDead = DEAD;
		score++;
		actualScore++;
		shotFlag = 0;
		oldScopeBigRow = scopeBigRow;
		oldScopeBigCol = scopeBigCol;
		if(rand()%2 == 0) {
			whichBloodSprite = 24;
		} else {
			whichBloodSprite = 26;
		}

		if (score > 9) {
			score = 0;
			scoreTenth++;
			if(actualScore > 99) {
				state = WIN;
			}
		}
		playSoundB(TeemoDeath, TEEMODEATHLEN, TEEMODEATHFREQ);
	} else {
		playSoundB(GunShot,GUNSHOTLEN,GUNSHOTFREQ);
	}
}

void checkDead(){
	if(shotFlag == 0) {
		enemyBloodCounter++;
		if(enemyBloodCounter > 15) {
			shotFlag = 1;
			enemyBloodCounter = 0;
			flyingBloodFlag = 0;
		}
	}
	if(flyingBloodFlag == 0) {
		enemyBloodCounter++;
		if(enemyBloodCounter == 10) {
			bloodVelocity++;
		}
		if(enemyBloodCounter == 20) {
			bloodVelocity++;
		}
		if(enemyBloodCounter > 30) {
			flyingBloodFlag = 1;
			bloodVelocity = 1;
			enemyBloodCounter = 0;
		}
	}

	if(enemies.isDead == DEAD) {
		if(enemies.deathCounter > 70){
			enemies.aniState = 16;
		}
		enemies.deathCounter++;
	}
}

void respawn(){
	if(enemies.isDead == DEAD && enemies.deathCounter > 160) {
		enemies.aniState = 0;
		enemies.deathCounter = 0;
		enemies.isDead = ALIVE;
		currBush = rand()%5;
	}
}

void didHeShoot(){
	if(enemies.isDead == ALIVE && rand()%enemyFreq == 1 && shootingFlag == NOTSHOOTING) {
		shootingFlag = SHOOTING;
		health++;
		bloodCounter = 0;
		playSoundB(TeemoShot,TEEMOSHOTLEN,TEEMOSHOTFREQ);
	}

	if(shootingFlag == SHOOTING) {
		bloodCounter ++;
		if(bloodCounter > 20) {
			shootingFlag = NOTSHOOTING;
		}
	}
}

void didHeMove() {
	if(enemies.isDead == ALIVE && rand()%enemyFreq == 2 && shootingFlag == NOTSHOOTING) {
		currBush = rand()%5;
		playSoundB(TeemoMove, TEEMOMOVELEN, TEEMOMOVEFREQ);
	}
}

void checkLevel() {
	if(actualScore % 5 == 0 && levelFlag < 2 && actualScore > 0) {
		soundCounter++;
		if(levelFlag == 0) {
			level++;
			health = 0;
			enemyFreq = enemyFreq - 100;
			levelFlag = 1;
			levelSpriteFlag = 0;
		}
		if(soundCounter > 51) {
			playSoundB(CaitlynShot, CAITLYNSHOTLEN, CAITLYNSHOTFREQ);
			levelFlag = 2;
			soundCounter = 0;
			levelSpriteFlag = 1;
			levelUpVelocity = 0;
		}
	}
	if(actualScore % 5 == 1) {
		levelFlag = 0;
	}
	if(levelSpriteFlag == 0 && soundCounter % 5 == 0) {
		levelUpVelocity++;
	}
}

void pause() 
{
	REG_DISPCTL = MODE4 | BG2_ENABLE;

	loadPalette(SplashPal);
	drawBackgroundImage4(PauseBitmap);
	while(1) 
	{
        oldButtons = buttons;
		buttons = BUTTONS;
		if(BUTTON_PRESSED(BUTTON_START)) {
			state = GAME;
			unpauseSound();
			waitForVblank();
			fillScreen4(0);
			return;
		}
		if(BUTTON_PRESSED(BUTTON_SELECT)) {
			initialize();
			state = GAME;
			unpauseSound();
			waitForVblank();
			fillScreen4(0);
			return;
		}
	}
}

void win() 
{
	REG_DISPCTL = MODE4 | BG2_ENABLE;
	playSoundB(Victory,VICTORYLEN,VICTORYFREQ);

	loadPalette(SplashPal);
	drawBackgroundImage4(WinBitmap);
	while(1){
	    oldButtons = buttons;
		buttons = BUTTONS;
		if(BUTTON_PRESSED(BUTTON_START)) {
			state = SPLASH;
			playSoundA(CharSelect,CHARSELECTLEN,CHARSELECTFREQ);
			waitForVblank();
			fillScreen4(0);
			return;
		}
	}
}

void lose() 
{
	REG_DISPCTL = MODE4 | BG2_ENABLE;
	playSoundB(Defeat,DEFEATLEN,DEFEATFREQ);

	loadPalette(SplashPal);
	drawBackgroundImage4(LoseBitmap);
	while(1){
	    oldButtons = buttons;
		buttons = BUTTONS;
		if(BUTTON_PRESSED(BUTTON_START)) {
			state = SPLASH;
			playSoundA(CharSelect,CHARSELECTLEN,CHARSELECTFREQ);
			waitForVblank();
			fillScreen4(0);
			return;
		}
	}
}

void hideSprites()
{
    int i;for(i = 0; i < 128; i++)
    {
         shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}

void updateOAM()
{
	//Blood
	if(shootingFlag == SHOOTING) {
		shadowOAM[6].attr0 = (ROWMASK & 96) | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_BLEND;
		shadowOAM[6].attr1 = (COLMASK & 0) | ATTR1_SIZE64;
		shadowOAM[6].attr2 = (SPRITEOFFSET16(24,0)) | ATTR2_PRIOR1 | ATTR2_PAL1;

		shadowOAM[7].attr0 = (ROWMASK & 96) | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_BLEND;
		shadowOAM[7].attr1 = (COLMASK & 176) | ATTR1_SIZE64 | ATTR1_HFLIP;
		shadowOAM[7].attr2 = (SPRITEOFFSET16(24,0)) | ATTR2_PRIOR1 | ATTR2_PAL1;

		shadowOAM[8].attr0 = (ROWMASK & 0) | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_BLEND;
		shadowOAM[8].attr1 = (COLMASK & 0) | ATTR1_SIZE64;
		shadowOAM[8].attr2 = (SPRITEOFFSET16(24,8)) | ATTR2_PRIOR1 | ATTR2_PAL1;

		shadowOAM[9].attr0 = (ROWMASK & 0) | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_BLEND;
		shadowOAM[9].attr1 = (COLMASK & 176) | ATTR1_SIZE64 | ATTR1_HFLIP;
		shadowOAM[9].attr2 = (SPRITEOFFSET16(24,8)) | ATTR2_PRIOR1 | ATTR2_PAL1;
	} else {
		shadowOAM[6].attr0 = ATTR0_HIDE;
		shadowOAM[7].attr0 = ATTR0_HIDE;
		shadowOAM[8].attr0 = ATTR0_HIDE;
		shadowOAM[9].attr0 = ATTR0_HIDE;
	}
	//Bushes
	shadowOAM[0].attr0 = (ROWMASK & bushes[0].row) | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[0].attr1 = (COLMASK & bushes[0].col) | ATTR1_SIZE64;
	shadowOAM[0].attr2 = (SPRITEOFFSET16(0,16)) | ATTR2_PAL1 | ATTR2_PRIOR3;

	shadowOAM[1].attr0 = (ROWMASK & bushes[1].row) | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[1].attr1 = (COLMASK & bushes[1].col) | ATTR1_SIZE64;
	shadowOAM[1].attr2 = (SPRITEOFFSET16(0,8)) | ATTR2_PAL1 | ATTR2_PRIOR3;

	shadowOAM[2].attr0 = (ROWMASK & bushes[2].row) | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[2].attr1 = (COLMASK & bushes[2].col) | ATTR1_SIZE64;
	shadowOAM[2].attr2 = (SPRITEOFFSET16(0,0)) | ATTR2_PAL1 | ATTR2_PRIOR3;

	shadowOAM[3].attr0 = (ROWMASK & bushes[3].row) | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[3].attr1 = (COLMASK & bushes[3].col) | ATTR1_SIZE64 | ATTR1_HFLIP;
	shadowOAM[3].attr2 = (SPRITEOFFSET16(0,8)) | ATTR2_PAL1 | ATTR2_PRIOR3;

	shadowOAM[4].attr0 = (ROWMASK & bushes[4].row) | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[4].attr1 = (COLMASK & bushes[4].col) | ATTR1_SIZE64 | ATTR1_HFLIP;
	shadowOAM[4].attr2 = (SPRITEOFFSET16(0,16)) | ATTR2_PAL1 | ATTR2_PRIOR3;
	//Enemy
	shadowOAM[5].attr0 = (ROWMASK & enemies.row) | ATTR0_4BPP | ATTR0_TALL;
	shadowOAM[5].attr1 = (COLMASK & enemies.col) | ATTR1_SIZE64;
	shadowOAM[5].attr2 = (SPRITEOFFSET16(enemies.isDead,enemies.aniState)) | ATTR2_PRIOR3;
	//Score
	shadowOAM[10].attr0 = (ROWMASK & 1) | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[10].attr1 = (COLMASK & 224) | ATTR1_SIZE8;
	shadowOAM[10].attr2 = (SPRITEOFFSET16(6,scoreTenth)) | ATTR2_PAL1 | ATTR2_PRIOR1;

	shadowOAM[11].attr0 = (ROWMASK & 1) | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[11].attr1 = (COLMASK & 232) | ATTR1_SIZE8;
	shadowOAM[11].attr2 = (SPRITEOFFSET16(6,score)) | ATTR2_PAL1 | ATTR2_PRIOR1;
	//Health
	shadowOAM[12].attr0 = (ROWMASK & 1) | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[12].attr1 = (COLMASK & 1) | ATTR1_SIZE32;
	shadowOAM[12].attr2 = (SPRITEOFFSET16(4,health*4)) | ATTR2_PRIOR1 | ATTR2_PAL1;

	//Cheat
	if(cheatFlag == 0) {
		shadowOAM[13].attr0 = (ROWMASK & 152) | ATTR0_4BPP | ATTR0_WIDE;
		shadowOAM[13].attr1 = (COLMASK & 224) | ATTR1_SIZE8;
		shadowOAM[13].attr2 = (SPRITEOFFSET16(6,10)) | ATTR2_PRIOR1 | ATTR2_PAL1;
	} else {
		shadowOAM[13].attr0 = (ROWMASK & 152) | ATTR0_4BPP | ATTR0_WIDE;
		shadowOAM[13].attr1 = (COLMASK & 224) | ATTR1_SIZE8;
		shadowOAM[13].attr2 = (SPRITEOFFSET16(6,12)) | ATTR2_PRIOR1 | ATTR2_PAL1;
	}

	//Level
	shadowOAM[14].attr0 = (ROWMASK & 152) | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[14].attr1 = (COLMASK & 32) | ATTR1_SIZE8;
	shadowOAM[14].attr2 = (SPRITEOFFSET16(6,level)) | ATTR2_PRIOR1 | ATTR2_PAL1;

	//Enemy's blood
	if(shotFlag == 0) {
		shadowOAM[15].attr0 = (ROWMASK & (oldScopeBigRow - vOff - 8)) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[15].attr1 = (COLMASK & (oldScopeBigCol - hOff - 8)) | ATTR1_SIZE16;
		shadowOAM[15].attr2 = (SPRITEOFFSET16(0,whichBloodSprite)) | ATTR2_PRIOR2 | ATTR2_PAL1;
	} else {
		shadowOAM[15].attr0 = ATTR0_HIDE;
	}

	if(flyingBloodFlag == 0) {
		shadowOAM[16].attr0 = (ROWMASK & ((oldScopeBigRow - vOff + 2) + bloodVelocity)) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[16].attr1 = (COLMASK & ((oldScopeBigCol - hOff + 2) + bloodVelocity)) | ATTR1_SIZE8;
		shadowOAM[16].attr2 = (SPRITEOFFSET16(0,28)) | ATTR2_PRIOR2 | ATTR2_PAL1;

		shadowOAM[17].attr0 = (ROWMASK & ((oldScopeBigRow - vOff - 6) - bloodVelocity)) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[17].attr1 = (COLMASK & ((oldScopeBigCol - hOff - 6) - bloodVelocity)) | ATTR1_SIZE8;
		shadowOAM[17].attr2 = (SPRITEOFFSET16(0,28)) | ATTR2_PRIOR2 | ATTR2_PAL1;

		shadowOAM[18].attr0 = (ROWMASK & ((oldScopeBigRow - vOff + 6) + bloodVelocity)) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[18].attr1 = (COLMASK & ((oldScopeBigCol - hOff - 6) - bloodVelocity)) | ATTR1_SIZE8;
		shadowOAM[18].attr2 = (SPRITEOFFSET16(0,29)) | ATTR2_PRIOR2 | ATTR2_PAL1;

		shadowOAM[19].attr0 = (ROWMASK & ((oldScopeBigRow - vOff - 6) - bloodVelocity)) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[19].attr1 = (COLMASK & ((oldScopeBigCol - hOff + 6) + bloodVelocity)) | ATTR1_SIZE8;
		shadowOAM[19].attr2 = (SPRITEOFFSET16(0,29)) | ATTR2_PRIOR2 | ATTR2_PAL1;
	} else {
		shadowOAM[16].attr0 = ATTR0_HIDE;
		shadowOAM[17].attr0 = ATTR0_HIDE;
		shadowOAM[18].attr0 = ATTR0_HIDE;
		shadowOAM[19].attr0 = ATTR0_HIDE;
	}

	if(levelSpriteFlag == 0) {
		shadowOAM[20].attr0 = (ROWMASK & (144 - levelUpVelocity)) | ATTR0_4BPP | ATTR0_WIDE;
		shadowOAM[20].attr1 = (COLMASK & 0) | ATTR1_SIZE8;
		shadowOAM[20].attr2 = (SPRITEOFFSET16(4,20)) | ATTR2_PRIOR1 | ATTR2_PAL1;

		shadowOAM[21].attr0 = (ROWMASK & (144 - levelUpVelocity)) | ATTR0_4BPP | ATTR0_WIDE;
		shadowOAM[21].attr1 = (COLMASK & 18) | ATTR1_SIZE8;
		shadowOAM[21].attr2 = (SPRITEOFFSET16(4,22)) | ATTR2_PRIOR1 | ATTR2_PAL1;
	} else {
		shadowOAM[20].attr0 = ATTR0_HIDE;
		shadowOAM[21].attr0 = ATTR0_HIDE;
	}
	//MOAR BUSHES
	shadowOAM[22].attr0 = (ROWMASK & boringBushes[0].row) | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[22].attr1 = (COLMASK & boringBushes[0].col) | ATTR1_SIZE64;
	shadowOAM[22].attr2 = (SPRITEOFFSET16(0,0)) | ATTR2_PAL1 | ATTR2_PRIOR3;

	shadowOAM[23].attr0 = (ROWMASK & boringBushes[1].row) | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[23].attr1 = (COLMASK & boringBushes[1].col) | ATTR1_SIZE64;
	shadowOAM[23].attr2 = (SPRITEOFFSET16(0,8)) | ATTR2_PAL1 | ATTR2_PRIOR3;

	shadowOAM[24].attr0 = (ROWMASK & boringBushes[2].row) | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[24].attr1 = (COLMASK & boringBushes[2].col) | ATTR1_SIZE64;
	shadowOAM[24].attr2 = (SPRITEOFFSET16(0,16)) | ATTR2_PAL1 | ATTR2_PRIOR3;

	shadowOAM[25].attr0 = (ROWMASK & boringBushes[3].row) | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[25].attr1 = (COLMASK & boringBushes[3].col) | ATTR1_SIZE64;
	shadowOAM[25].attr2 = (SPRITEOFFSET16(0,8)) | ATTR2_PAL1 | ATTR2_PRIOR3;

	shadowOAM[26].attr0 = (ROWMASK & boringBushes[4].row) | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[26].attr1 = (COLMASK & boringBushes[4].col) | ATTR1_SIZE64;
	shadowOAM[26].attr2 = (SPRITEOFFSET16(0,0)) | ATTR2_PAL1 | ATTR2_PRIOR3;

}
