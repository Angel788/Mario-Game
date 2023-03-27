#include <Wire.h> 
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27,20,4);
int pinesEntradaFpgaEscenario[]={2,3,4,5,6,7};
int pinesFpgaMultiplexor[]={8,9,10};
int pinesPosicion[]={11,12};

int pisoMapa[16][5];
int enemigosMapa[16][5];
byte columna[9];
 byte salidasFpgaPosicion[2];
int posicionRMario;

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
  lcd.clear();  
  lcd.setCursor(0, 0);
  lcd.createChar(0, nubes);
  lcd.createChar(1, enemigos);
  lcd.createChar(2, mario);
  lcd.createChar(3, tuberias);
  lcd.createChar(4, piso);  
  pinMode(pinesEntradaFpgaEscenario[0],INPUT);
  pinMode(pinesEntradaFpgaEscenario[1],INPUT);
  pinMode(pinesEntradaFpgaEscenario[2],INPUT);
  pinMode(pinesEntradaFpgaEscenario[3],INPUT);
  pinMode(pinesEntradaFpgaEscenario[4],INPUT);
  pinMode(pinesEntradaFpgaEscenario[5],INPUT);
  pinMode(pinesFpgaMultiplexor[0],OUTPUT);
  pinMode(pinesFpgaMultiplexor[1],OUTPUT);
  pinMode(pinesFpgaMultiplexor[2],OUTPUT);
  pinMode(pinesPosicion[0],INPUT);
  pinMode(pinesPosicion[1],INPUT);
  //lcd.createChar(0,nubes);
}
void multiplexor(int numero){
    //digitalWrite(pinesFpgaMultiplexor[0],bitRead(numero,2));
    if(numero==0){
    digitalWrite(pinesFpgaMultiplexor[2],LOW);
    digitalWrite(pinesFpgaMultiplexor[1],LOW);
    digitalWrite(pinesFpgaMultiplexor[0],LOW);
    }
    if(numero==1){
    digitalWrite(pinesFpgaMultiplexor[2],HIGH);
    digitalWrite(pinesFpgaMultiplexor[1],LOW);
    digitalWrite(pinesFpgaMultiplexor[0],LOW);
    }
   if(numero==2){
    digitalWrite(pinesFpgaMultiplexor[2],LOW);
    digitalWrite(pinesFpgaMultiplexor[1],HIGH);
    digitalWrite(pinesFpgaMultiplexor[0],LOW);
    }
    if(numero==3){
    digitalWrite(pinesFpgaMultiplexor[2],HIGH);
    digitalWrite(pinesFpgaMultiplexor[1],HIGH);
    digitalWrite(pinesFpgaMultiplexor[0],LOW);
    }
    if(numero==4){
    digitalWrite(pinesFpgaMultiplexor[2],LOW);
    digitalWrite(pinesFpgaMultiplexor[1],LOW);
    digitalWrite(pinesFpgaMultiplexor[0],HIGH);
    }
    if(numero==5){
    digitalWrite(pinesFpgaMultiplexor[2],HIGH);
    digitalWrite(pinesFpgaMultiplexor[1],LOW);
    digitalWrite(pinesFpgaMultiplexor[0],HIGH);
    }
    if(numero==6){
    digitalWrite(pinesFpgaMultiplexor[2],LOW);
    digitalWrite(pinesFpgaMultiplexor[1],HIGH);
    digitalWrite(pinesFpgaMultiplexor[0],HIGH);
    }
    if(numero==7){
    digitalWrite(pinesFpgaMultiplexor[2],HIGH);
    digitalWrite(pinesFpgaMultiplexor[1],HIGH);
    digitalWrite(pinesFpgaMultiplexor[0],HIGH);
    }                 
    //digitalWrite(pinesFpgaMultiplexor[1],bitRead(numero,1));
    //digitalWrite(pinesFpgaMultiplexor[2],bitRead(numero,0));
}
void datosColumna(){
    columna[0]=digitalRead(pinesEntradaFpgaEscenario[0]);
    columna[1]=digitalRead(pinesEntradaFpgaEscenario[1]);
    columna[2]=digitalRead(pinesEntradaFpgaEscenario[2]);
    columna[3]=digitalRead(pinesEntradaFpgaEscenario[3]);
    columna[4]=digitalRead(pinesEntradaFpgaEscenario[4]);
    columna[5]=digitalRead(pinesEntradaFpgaEscenario[5]);
}
void procesarDatosColumna(int c){
     if(columna[0]) pisoMapa[c][0]=1;
     else pisoMapa[c][0]=0;
     if(columna[1]) pisoMapa[c][1]=1;
     else pisoMapa[c][1]=0;
     if(columna[2]) pisoMapa[c][2]=1;
     else pisoMapa[c][2]=0; 
     if(columna[3]) enemigosMapa[c][0]=1;
     else enemigosMapa[c][0]=0;
     if(columna[4]) enemigosMapa[c][1]=1;
     else enemigosMapa[c][1]=0;
     if(columna[5]) enemigosMapa[c][2]=1;
     else enemigosMapa[c][2]=0; 
}
void imprimirEscenario(){
    for(int i=0;i<8;i++){
      lcd.setCursor(i,0);
      if(i%3==0) lcd.write(0);       
      for(int j=1;j<=3;j++){
        lcd.setCursor(i,j);
        if(i==0 && posicionRMario==j){
          lcd.write(2);
        }
        else{
        if(pisoMapa[i][j-1]==1 && enemigosMapa[i][j-1]!=1) lcd.write(4);
        else if(enemigosMapa[i][j-1]==1) lcd.write(1);
        else lcd.print(" ");
        }
      }      
    }  
}
void posicionMario(){
  salidasFpgaPosicion[0]=digitalRead(pinesPosicion[0]);
  salidasFpgaPosicion[1]=digitalRead(pinesPosicion[1]);    
  if(salidasFpgaPosicion[0]==0 && salidasFpgaPosicion[1]==0)posicionRMario=3;
  if(salidasFpgaPosicion[0]==1 && salidasFpgaPosicion[1]==0)posicionRMario=2;  
  if(salidasFpgaPosicion[0]==0 && salidasFpgaPosicion[1]==1)posicionRMario=1;
  if(salidasFpgaPosicion[0]==1 && salidasFpgaPosicion[1]==1)posicionRMario=0; 
}
void loop() {
  /*lcd.setCursor(0,0);
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
  lcd.setCursor(0,0);*/
  posicionMario();
  for(int i=0;i<8;i++){
    multiplexor(i);
    datosColumna();
    procesarDatosColumna(i);                             
    delay(50);     
  }
  lcd.setCursor(13,0);
  lcd.print("4CM3");
  lcd.setCursor(13,1);
  lcd.print("Mario");
  lcd.setCursor(13, 2);
  imprimirEscenario();
  delay(500);     
  lcd.clear();  
}
