#include <Wire.h> 
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27,20,4);
byte nubes[]{
    B00000,
    B00000,
    B00000,
    B01001,
    B11110,
    B01111,
    B11110,
    B01010  
};
byte enemigos[]{
    B00000,
    B00000,
    B00000,
    B00000,
    B00100,
    B01110,
    B11111,
    B01010  
};
byte mario[]{
    B01110,
    B01110,
    B01110,
    B00100,
    B01110,
    B10101,
    B00100,
    B11011  
};
byte tuberias[]{
     B00000,
     B00000,
     B00000,
     B11111,
     B11111,
     B01110,
     B01110,
     B01110  
};
byte piso[]{
  	0B00000,
	  0B00000,
	  0B00000,
	  0B00000,
	  0B00000,
	  0B00000,
	  0B11111,
	  0B11111
};
void setup() {
  lcd.init();
  lcd.backlight();  
  lcd.setCursor(0, 0);
  lcd.createChar(0, nubes);
  lcd.createChar(1, enemigos);
  lcd.createChar(2, mario);
  lcd.createChar(3, tuberias);
  lcd.createChar(4, piso);   
  //lcd.createChar(0,nubes);
}

void loop() {
  lcd.setCursor(0,0);
  lcd.write(0);
  lcd.setCursor(1,0);
  lcd.write(1);
  lcd.setCursor(2,0);
  lcd.write(2);
  lcd.setCursor(3,0);
  lcd.write(3);
  lcd.setCursor(4,0);
  lcd.write(4);
  lcd.setCursor(0, 1);
  lcd.print("Mario");
  lcd.setCursor(0,0);
}
