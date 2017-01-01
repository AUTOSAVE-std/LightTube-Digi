import processing.sound.*;
import codeanticode.syphon.*;
import themidibus.*;

MidiBus mb;
SyphonServer server;
SoundFile file;
SoundFile file2;
PImage img1;
int Yposition,X1pos;
int widthofimg = 162;
int timelimit = 5000; //sec
int count=0;
int FrameMyAss = 15;
char LIST[] = {'0', '0', '0', '0', '0','0', '0', '0', '0', '0'};
void settings() {
  size(900, 300, P3D);
  PJOGL.profile=1;
  
}
void setup() {
  size(900, 300);
  frameRate(FrameMyAss);
  mb = new MidiBus(this, -1, "autosave");
  Yposition = height/2-100;
  X1pos = width/20;
  file = new SoundFile(this, "sound4.aif");
  file2 = new SoundFile(this, "special.aif");
  server = new SyphonServer(this, "Processing Syphon");
}

void draw() {
  background(0,0,0);
   text("LightTube DIGI - AUTOSAVE CO.,LTD", 10, 20);
  for(int x=5;x<10;x++){
    callforAPL(x);
    image(img1, X1pos+((x-5)*widthofimg), Yposition);
  }
  count++;
  if(count/FrameMyAss == timelimit){
    mb.sendNoteOn(0, 51, 255);
    DeleteALLSwang();
  }
  server.sendScreen();
}
void callforAPL(int x){
  String FUCKINGSTRING = LIST[x]+".png";
  img1 = loadImage(FUCKINGSTRING);
  
}

void keyPressed() {
  count = 0;
  mb.sendNoteOn(0, 50, 255);
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
  
  if(key == BACKSPACE || key == DELETE) {
    //Delete
    file2.play();
    DeleteMySwang();
  }
  if(key == 32) {
    //Spacebar
    file2.play();
    mySWANG('`');
  }
  
  if(key == TAB) {
    DeleteALLSwang();
  }
  
}
void DeleteALLSwang(){
  for(int y=0;y<10;y++){
    LIST[y] =  '`';
  }
}
void DeleteMySwang(){
  for(int y=9;y>0;y--){
    LIST[y] =  LIST[y-1];
  }
  LIST[0] = '`';
}
void mySWANG(char key){
  for(int y=0;y<9;y++){
    LIST[y] =  LIST[y+1];
  }
  String SB = str(key).toLowerCase();
  LIST[9] = SB.charAt(0);
  for(int y=0;y<10;y++){
    print(LIST[y]);
  }
   println(" ");
  
}