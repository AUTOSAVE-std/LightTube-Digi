import processing.sound.*;
import codeanticode.syphon.*;

SyphonServer server;
SoundFile file;
SoundFile file2;
PImage img1,img2,img3,img4,img5;
int Yposition,X1pos;
int widthofimg = 162;
char LIST[] = {'x', 'x', '0', 'y', 'y'};
void settings() {
  size(900, 300, P3D);
  PJOGL.profile=1;
}
void setup() {
  size(900, 300);
  Yposition = height/2-100;
  X1pos = width/20;
  file = new SoundFile(this, "sound1.mp3");
  file2 = new SoundFile(this, "sound2.mp3");
  server = new SyphonServer(this, "Processing Syphon");
}

void draw() {
  background(0,0,0);
   text("LightTube DIGI - AUTOSAVE CO.,LTD", 10, 20);
  for(int x=0;x<5;x++){
    callforAPL(x);
    image(img1, X1pos+(x*widthofimg), Yposition);
  }
  server.sendScreen();
}
void callforAPL(int x){
  String FUCKINGSTRING = LIST[x]+".png";
  img1 = loadImage(FUCKINGSTRING);
}

void keyPressed() {
  background(255,0,0);
  if ( key >= 65 && key <=90 || 
  key >= 48 && key <= 57 ||
  key >= 97 && key <= 122 ||
  key == '_' ||
  key == '-' ||
  key == '<' ||
  key == '>' ||
  key == '=' ||
  key == '|' ||
  key == '}'
) {
    file.play();
    mySWANG(key);
  }
  background(255,0,255);
}
void mySWANG(char key){
  for(int y=0;y<4;y++){
    LIST[y] =  LIST[y+1];
  }
  String SB = str(key).toLowerCase();
  LIST[4] = SB.charAt(0);
  print(key);
  
}

//key=='a'||key=='A'||
//key=='b'||key=='B'||
//key=='c'||key=='C'||
//key=='d'||key=='D'||
//key=='e'||key=='E'||
//key=='f'||key=='F'||
//key=='g'||key=='G'||
//key=='h'||key=='H'||
//key=='i'||key=='I'||
//key=='j'||key=='J'||
//key=='k'||key=='K'||
//key=='l'||key=='L'||
//key=='m'||key=='M'||
//key=='n'||key=='N'||
//key=='o'||key=='O'||
//key=='p'||key=='P'||
//key=='q'||key=='Q'||
//key=='r'||key=='R'||
//key=='s'||key=='S'||
//key=='t'||key=='T'||
//key=='u'||key=='U'||
//key=='v'||key=='V'||
//key=='w'||key=='W'||
//key=='x'||key=='X'||
//key=='y'||key=='Y'||
//key=='z'||key=='Z'