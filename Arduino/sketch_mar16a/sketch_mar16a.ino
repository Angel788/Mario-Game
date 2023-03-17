#include <LiquidCrystal.h>

int piso[4][16];
int mario[2];
int enemigos[4][16];

byte customChar[][]={
   {
    B00000,
    B00000,
    B00000,
    B01001,
    B11110,
    B01111,
    B11110,
    B01010
   },#NUBES
   {
    B00000,
    B00000,
    B00000,
    B00000,
    B00100,
    B01110,
    B11111,
    B01010     
   },#Enemigos
   {
    B01110,
    B01110,
    B01110,
    B00100,
    B01110,
    B10101,
    B00100,
    B11011
   }#Mario         
};

void setup() {
  // put your setup code here, to run once:

}

void loop() {
  // put your main code here, to run repeatedly:

}
