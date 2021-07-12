import gab.opencv.*;

import processing.video.*;

Capture cam;

OpenCV opencv;                      //  Creates a new OpenCV object
PImage movementImg;                 //  Creates a new PImage to hold the movement image
int poppedBubbles;                  //  Creates a variable to hold the total number of popped bubbles
ArrayList bubbles;                  //  Creates an ArrayList to hold the Bubble objects
ArrayList bubbles1;                 //  Creates an ArrayList to hold the Bubble objects
ArrayList bubbles2;
int print1;
int print2;
//PImage bubblePNG;                   //  Creates a PImage that will hold the image of the bubble
PImage start_screen;
PImage mangoPNG;
PImage mangoPNG1;
PImage mangoPNG2;
PImage glass;
PImage img1;
PImage img2;
PImage bottle_cut;
PImage score_bt;
PImage score_vg;
PImage score_nt;
PImage bottle_1;
PImage fo;
//PImage post_score;
boolean popped;
boolean active;
//#FFF000
PFont font;                         //  Creates a new font object
PFont font1;
StopWatchTimer sw;

int INTRO     = 1;
int RUN_GAME  = 2;
int GAME_OVER = 3;
int WIN_GAME=4;
int BUMPER_PRIZE=5;
int gameState =INTRO;
int level=1,threshold = 200;
PImage splash;
PImage center_mango;
int j = 132;
PImage src;

void setup()
{
  size ( 1280, 720 );
  // Start capturing
  cam = new Capture(this, 1280, 720);
  cam.start();
  opencv = new OpenCV(this, cam.width, cam.height);

  
  movementImg = new PImage( 1280, 720 );   //  Initialises the PImage that holds the movement image
  start_screen=loadImage("Frooti Freakout Game Play.jpg");
  glass=loadImage("Bottle.png");
  img1=loadImage("mango_tree_logo_1280x720.png");
  img2=loadImage("Splash155.png");
  bottle_cut=loadImage("Bottle_BK_PLATE.png");
  bottle_1=loadImage("Bottle_1_new.png");
  score_bt=loadImage("Score_BT.png");
  score_nt=loadImage("Score_NT.png");
  score_vg=loadImage("Score_VG.png");
  fo=loadImage("Freak_Out_LD.png");
  splash=loadImage("Bottle_new.png");
  center_mango=loadImage("center_mango_01.png");
  sw=new StopWatchTimer();
  sw.start();

  poppedBubbles = 0;                     
  bubbles = new ArrayList();              //  Initialises the ArrayList
  bubbles1 = new ArrayList();              //  Initialises the ArrayList
  bubbles2=new ArrayList();

  mangoPNG=loadImage("Mango75.png");
  mangoPNG1=loadImage("Mango75.png");
  mangoPNG2=loadImage("Mango100 2.png");

    font = createFont("Oceania-Medium",48,true);        //  Load the font file into memory
    font1=createFont("Oceania-Bold",70,true);

}

void captureEvent(Capture cam) {
  cam.read();
}

void draw()
{
  
  if (gameState==INTRO) {
    intro();
  }
  if (gameState==RUN_GAME) {
    run_game();
  }
  if (gameState==GAME_OVER) {
    game_over();
  }
  if (gameState==WIN_GAME) {
    win_game();
  }
  if (gameState==BUMPER_PRIZE) {
    bumper_prize();
  }
  
  fill(255,0,0);
  text("Threshold : "+threshold, 50,200);
  
  fill(255,0,0);
  text("j : "+j, 50,250);
 
}
void run_game() { 
   opencv.loadImage(cam);
   opencv.flip(OpenCV.HORIZONTAL);
   src = opencv.getOutput();  
  opencv.gray();                //  Converts to greyscale
  opencv.threshold(threshold);  
  movementImg = src;
  image( src, 0, 0, 1280, 720 ); 
  
  
  
  Bubble b=new Bubble(int(random(0,150)),-mangoPNG.height,mangoPNG.height,mangoPNG.width);
  Bubble b1=new Bubble(int(random(0,250)),(-mangoPNG.height*2),mangoPNG.height,mangoPNG.width);
  
  Bubble b2=new Bubble(int(random(0,300)),(-mangoPNG.height*4),mangoPNG.height,mangoPNG.width);
  
  Bubble b3=new Bubble(int(random(0,350)),-mangoPNG.height,mangoPNG.height,mangoPNG.width);


  bubbles.add(b);
  bubbles.add(b1);
  bubbles.add(b2);
  bubbles.add(b3);
  
  
  
  Bubble bb= new Bubble(int(random(930,1200)),-mangoPNG.height,mangoPNG.width,mangoPNG.height);
  Bubble bb1= new Bubble(int(random(800,1200)),(-mangoPNG.height*2),mangoPNG.width,mangoPNG.height);
  Bubble bb2= new Bubble(int(random(700,1200)),int((-mangoPNG.height*2.5)),mangoPNG.width,mangoPNG.height);

  Bubble bb3= new Bubble(int(random(850,1200)),int((-mangoPNG.height*2.7)),mangoPNG.width,mangoPNG.height);

  bubbles1.add(bb);
  bubbles1.add(bb1);
  bubbles1.add(bb2);
  bubbles1.add(bb3);
  
  
  Bubble bbb= new Bubble(int(random(850,1200)),(-mangoPNG.height*4),mangoPNG.width,mangoPNG.height);
  Bubble bbb1= new Bubble(int(random(850,1200)),(-mangoPNG.height*3),mangoPNG.width,mangoPNG.height);
  Bubble bbb2= new Bubble(int(random(850,1200)),(-mangoPNG.height*2),mangoPNG.width,mangoPNG.height);

 
  
  for ( int i = 0; i < 4; i++ ) {
    Bubble _bubble = (Bubble) bubbles.get(i);    //  Copies the current bubble into a temporary object

    if (_bubble.update() == 1) {                  //  If the bubble's update function returns '1'
      bubbles.remove(i);                        //  then remove the bubble from the array
      _bubble = null;                           //  and make the temporary bubble object null
      i--;                                      //  since we've removed a bubble from the array, we need to subtract 1 from i, or we'll skip the next bubble
    }
    else {                                        //  If the bubble's update function doesn't return '1'
      bubbles.set(i, _bubble);                  //  Copys the updated temporary bubble object back into the array
      _bubble = null;                           //  Makes the temporary bubble object null.
    }
  }
  
  for ( int i = 0; i < 4; i++ ) {    //  For every bubble in the bubbles array
    Bubble _bubble1 = (Bubble) bubbles1.get(i);    //  Copies the current bubble into a temporary object

    if (_bubble1.update1() == 1) {                  //  If the bubble's update function returns '1'
      bubbles1.remove(i);                        //  then remove the bubble from the array
      _bubble1 = null;                           //  and make the temporary bubble object null
      i--;                                      //  since we've removed a bubble from the array, we need to subtract 1 from i, or we'll skip the next bubble
    }
    else {                                        //  If the bubble's update function doesn't return '1'
      bubbles1.set(i, _bubble1);                  //  Copys the updated temporary bubble object back into the array
      _bubble1 = null;                           //  Makes the temporary bubble object null.
    }
  }
 
  for ( int i = 0; i <bubbles2.size(); i++ ) {    //  For every bubble in the bubbles array

    Bubble _bubble2 = (Bubble) bubbles2.get(i);    //  Copies the current bubble into a temporary object

    if (_bubble2.update2() == 1) {     
      bubbles2.remove(i);                        //  then remove the bubble from the array
      _bubble2 = null;                           //  and make the temporary bubble object null
      i--;                                      //  since we've removed a bubble from the array, we need to subtract 1 from i, or we'll skip the next bubble
    }
    else {                                        //  If the bubble's update function doesn't return '1'
      bubbles2.set(i, _bubble2);                  //  Copys the updated temporary bubble object back into the array
      _bubble2 = null;                           //  Makes the temporary bubble object null.
    }
  }



  image(bottle_cut, -20, 25, 1280, 720);
  
 if (poppedBubbles>=0 && poppedBubbles<350) {


    fill(#F58E07);
    noStroke();
    rect(37, 678, 60, -poppedBubbles*0.5);
  }
  else{
    fill(#F58E07);
    noStroke();
    rect(37, 678, 60, -150);
  }


  image(splash, -20, 25, 1280, 720);
  
  int s=sw.second();

  image(img1, 0, 0, 1280, 720);
  fill(#F8EF21);
  
  textFont(font,45);                                                //  flipped the image earlier, we need to flip it here too.

  text(""+nf(poppedBubbles,3), 280, 694);                //  Displays some text showing how many bubbles have been popped

  print1=(40-sw.second());

  text(nf(sw.minute(),2)+":"+print1,130,695);

   if (print1==32) {
    bubbles2.add(new Bubble(int(random(510, 12000)), -mangoPNG.height, mangoPNG.width, mangoPNG.height));   //  Adds a new bubble to the array with a random x position
}


  if (print1==15) {
    bubbles2.add(new Bubble(int(random(600, 16000)), -mangoPNG2.height, mangoPNG2.width, mangoPNG2.height));   //  Adds a new bubble to the array with a random x position
  }

  
  if((print1==0) && ((poppedBubbles>=0) && (poppedBubbles<=80))){
    gameState=GAME_OVER;
    bubbles.clear();
    bubbles1.clear();
   // sw.stop();
  }
  else if((print1==0) && ((poppedBubbles>=81) && (poppedBubbles<=160))){
    gameState=WIN_GAME;
    bubbles.clear();
    bubbles1.clear();
   // sw.stop();
  }
  else if((print1==0) && ((poppedBubbles>=161) && (poppedBubbles<=200 ))){
    gameState=BUMPER_PRIZE;
    bubbles.clear();
    bubbles1.clear();
  //  sw.stop();
  }
  else if((print1==0) && (poppedBubbles>=200)){
    gameState=BUMPER_PRIZE;
    bubbles.clear();
    bubbles1.clear();
  }  
}

void intro() {
  image(start_screen,0,0,1290,720);
  
}

void win_game() {


  opencv.loadImage(cam);
  opencv.flip(OpenCV.HORIZONTAL);
  src = opencv.getSnapshot();
  image(src, 0, 0, 1280, 720); 
  image(img1,0,0,1280,720);
  image(center_mango,0,0,1280,720);

  image(score_vg,0,0,1280,720);
    
  show_score();
  image(fo,0,0,1280,720);}

void game_over() {
  
  opencv.loadImage(cam);
  opencv.flip(OpenCV.HORIZONTAL);
  src = opencv.getSnapshot();
  image(src, 0, 0, 1280, 720); 
 
  image(img1,0,0,1280,720);

 image(center_mango,0,0,1280,720); 

  image(score_nt,0,0,1280,720);
  show_score();
  image(fo,0,0,1280,720);

}

void show_score() {
  fill(#F8EF21);
  textFont(font1,70);
  text(""+nf(poppedBubbles,3), 455, 630);
}

void keyPressed() {
  if(keyCode==ENTER){
  if (gameState==INTRO) {
    gameState = RUN_GAME; // start the game 
    poppedBubbles = 0; // reset the score
    sw.start();
  }  
  }

  if(keyCode==ENTER){
  if (gameState==GAME_OVER) {

    gameState=RUN_GAME;
    //level=1;
    poppedBubbles=0;
    sw.start();
  }
  }
  
  if(keyCode==ENTER){
  if (gameState==WIN_GAME) {
    
    gameState=RUN_GAME;
    poppedBubbles=0;
    //level=1;
    sw.start();
  }
  }
  
  
  if(keyCode==ENTER){
  if (gameState==BUMPER_PRIZE) {
    gameState=RUN_GAME;
    poppedBubbles=0;
    //level=1;
    sw.start();
  }
  }
 
  if(keyCode==' '){
  if((gameState==WIN_GAME) || (gameState==GAME_OVER) || (gameState==BUMPER_PRIZE)){
    sw.start();
  }
  }
  
  if(key == 't'){
    threshold = threshold + 10;
  }
  
  if(key == 'r'){
    threshold = threshold - 10;
  }
  
  if(key == 'q'){
    j = j + 5;
  }
  
  if(key == 'w'){
    j = j - 5;
  }
  }


void bumper_prize() {

  opencv.loadImage(cam);
  opencv.flip(OpenCV.HORIZONTAL);
  src = opencv.getSnapshot();
  image(src, 0, 0, 1280, 720); 
  
  image(img1,0,0,1280,720);
 
    image(center_mango,0,0,1280,720);

  
  image(score_bt,0,0,1280,720);
 
  show_score();
  image(fo,0,0,1280,720);
 
}
