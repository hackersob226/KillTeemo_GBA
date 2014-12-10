/*********************************************************************
 *
 * text.h
 *
 ********************************************************************/
#ifndef TEXT_H
#define TEXT_H

// Mode 3 text
void drawChar3(int row, int col, char ch, volatile unsigned short color);
void drawString3(int row, int col, char *str,volatile unsigned short color);

// Mode 4 text
void drawChar4(int row, int col, char ch,volatile unsigned char colorIndex);
void drawString4(int row, int col, char *str,volatile unsigned char colorIndex);

extern const unsigned char fontdata_6x8[12288];

#endif
