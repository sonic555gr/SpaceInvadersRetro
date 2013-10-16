/* 
 |====================|
 |Space Invaders Retro|  
 |====================| |=====================| 
 |        by          |=|This project was made|
 |Alkiviadis Papadakis|=|using Processing v1.1| 
 |   2010, Greece     | |=====================|
 |sonic555gr@gmail.com|  
 |====================|
 */

//import fullscreen.*;            // eisagwgi bibliothikis gia fullscreen
import ddf.minim.*;             // eisagwgi bibgliothikis gia toys hxoys kai thn mousikh
//**********************dilwsh global metablhtwn***************************************************************************
CountDown cDown;// countdown class
Gui gui;// gui
Intro intro;//dilwnw ena antikeimeno intro
//FullScreen fs;//dilwnw ena antikeimeno fullscreen
Instructions instructions;
Menu menu;

Credits credits;

int i;//
int j;
int level = 1;
float startTime; 
int time=0;
boolean isStarted = false;
boolean gameIsStarted = false;
boolean isFullscreen = true;
//********************SOUNDS********************************************************************************************
Sounds sounds;
Minim minim;//dilwnw ena antikeimeno Minim
//********************SPACESHIP********************************************************************************************
Space space;  // dilwnw ena antikeimeno space
float x;  //dilwnw to x toy diasthmopliou
float y;  //dilwnw to y toy diasthmopliou
float spaceShipSpeed = 2;  //taxythta diasthmoploioy
int Lives =5;
static final int MAX_LIVES = 5;
//**********************ALIENLASERS*********************************************************************************************
ArrayList alasers = new ArrayList();
int alaserSize;
int maxAlasers = 10;
int mod = 20;// the higher the rearest the aliens will shoot
//**********************LASER**********************************************************************************************
ArrayList lasers = new ArrayList();
int maxLasers = 6;

//**********************BOMBS**********************************************************************************************
ArrayList bombs = new ArrayList();
static final int MAX_BOMBS = 1;
int bombsCount = 100;

//**********************STARS**********************************************************************************************
int num = 100;  // plithos asteriwn
Star[] star = new Star[num];  // dilwnw ton pinaka me ta asteria
//**********************ALIENS*********************************************************************************************
Aliens aliens = new Aliens();
public int alienCount = 0;//
float alienSpeed = 1;  // h taxythta twn exwgihnwn
float aX = 35;  //dilwnw to x toy kathe exwgihnoy
float aY = 20;  //dilwnw to y toy kathe exwgihnoy
int alienSize;// an integer variable for storing the size of the aliens ArrayList();
int alienRand;//random alien choise to shoot laser
int dir = 1;
int health = 1 ;
//****************************SCORE****************************************************************************************
int score = 0;//score
int highScore = 2000;//highscore
//**********************CUSTOM ENUMERATOR**********************************************************************************
static final int PLAYING      =  1000;
static final int PAUSE        =  1001;
static final int OPTIONS      =  1002;
static final int RESTART      =  1003;
static final int COUNTDOWN    =  1004;
static final int STARTED      =  1005;
static final int CREDITS      =  1006;
static final int INTRO        =  1007;
static final int GAMEOVER     =  1008;
static final int LIFELOST     =  1009;
static final int INSTRUCTIONS =  1010;
static final int START        =  1011;
static final int RUSURE       =  1012;
static final int RUSURE2      =  1013;
int STATE = START;
//==========================================================================================================================
void setup (){
  size(1024,768);//
  noCursor();//
  minim = new Minim(this);//
//  fs = new FullScreen (this);//
  intro = new Intro();//
  smooth();
//  fs.enter();
  delay(3000);
  startTime = millis(); 
  x = width/2;//
  y = height -100;//
  stroke(255);//
  sounds = new Sounds();
  sounds.init();
  PFont font = loadFont("AgencyFB-Reg-32.vlw");//
  textFont(font);//
  newGame(level);
  gui = new Gui();
  intro.init();
  space = new Space(x,y);
  space.Lives = MAX_LIVES;
}

//=========================================================================================================================
void draw(){

  switch (STATE){
  case COUNTDOWN :
    cDown.display();
    break;
  case PLAYING:
    game();
    break;
  case PAUSE:
    menu.gamePaused();
    break;
  case CREDITS:
    credits.display();
    break;
  case OPTIONS :
    menu.options();
    break;
  case RESTART:
    menu.restart();
    break;
  case INTRO:
    intro.display();
    break;
  case INSTRUCTIONS:
    instructions.display();  
    break;
  case GAMEOVER :
    menu.gameOver();
    break;
  case LIFELOST :
    space.display();
    break;
  case START:
    menu.startScreen();
    break;
  case RUSURE:
    menu.areYouSureScreen();
    break;
  case RUSURE2:
    menu.areYouSureScreen2();
    break;
  }
}
//=========================================================================================================================
void stop()
{
  // always close Minim audio classes when you are done with them
  sounds.mainBgSound.close();

  sounds.mouseOverSound1.close();
  for(i = 0; i<9;i++)
    sounds.alaserSound[i].close();
  for(i=0;i<5;i++)
    sounds.killAlienSound[i].close();
  sounds.spaceDestruct.close();
  minim.stop();
  super.stop();
}
//=========================================================================================================================
void keyPressed(){


     
  if (STATE != PAUSE){
    switch(key){
    case 27:
    key  =  0;
    case 'p':
    case 'P':
      credits.Xpos = 30;
      credits.Ypos = height-50;
      
     //if (gameIsStarted)
        STATE = PAUSE;
          break;
           
          //STATE = START;
    }  
  }
  else
    switch (key){
    case 27:
    key  = 0;
    case 'p':
    case 'P':
        STATE = PLAYING;
      break;

    }
}
//=========================================================================================================================
void mouseDragged(){
  if (STATE == OPTIONS){
    if (menu.slider.mouseOver()){
      menu.slider.rectFill = 0;
      menu.slider.outerRectFill =255;
      //mouse = mouseX;
      menu.slider.mouse = constrain (mouseX,width-305,width-100);
      menu.slider.gain = map(menu.slider.mouse,width-300,width-100,-40,5);
     sounds.setMainSoundsGain(menu.slider.gain);
      
    }
    else
    {
      menu.slider.rectFill = 255;
      menu.slider.outerRectFill = 0;
    }
    if (menu.slider2.mouseOver()){
      menu.slider2.rectFill = 0;
      menu.slider2.outerRectFill =255;
      menu.slider2.mouse = constrain (mouseX,width-305,width-100);
      menu.slider2.gain = map(menu.slider2.mouse,width-300,width-100,-40,5);
       sounds.setAFXSoundsGain(menu.slider2.gain);
     
    }
    else
    {
      menu.slider2.rectFill = 255;
      menu.slider2.outerRectFill = 0;
    }
  }
}
//=========================================================================================================================
void mousePressed() {

  switch(STATE){
  case PAUSE :
    if(menu.btn[0].isOver()){//NEW GAME
      STATE = RUSURE;

    }
    else if (menu.btn[1].isOver()){//RESUME GAME
      if(isStarted)
        STATE = PLAYING;
    }
    else if(menu.btn[2].isOver()){//CREDITS
      STATE = CREDITS;
    }
    else if (menu.btn[3].isOver())//EXIT
      STATE = RUSURE2;
    else if (menu.btn[4].isOver())//OPTIONS
      STATE = OPTIONS;
    else if (menu.btn[5].isOver())
      STATE = INSTRUCTIONS;  
    break;
  case START:
    if(menu.btn[0].isOver()){//NEW GAME
      if (Lives<MAX_LIVES)
        Lives = MAX_LIVES;
      isStarted = true;
      STATE = COUNTDOWN;
      gameIsStarted = true;
      level = 1;
      bombsCount = 3;
      newGame(level);
    }

    else if(menu.btn[2].isOver()){//CREDITS
      STATE = CREDITS;
    }
    else if (menu.btn[3].isOver())//EXIT
      STATE = RUSURE2;
    else if (menu.btn[4].isOver())//OPTIONS
      STATE = OPTIONS;
    else if (menu.btn[5].isOver())//INSTRUCTIONS
      STATE = INSTRUCTIONS;  
    break;
  case OPTIONS:
    if (menu.optBtn[0].isOver()){ //FULLSCREEN MODE ON
    isFullscreen = true;
//      fs.enter();
    }
    else if (menu.optBtn[1].isOver()){//FULLSCREEN MODE OFF
    isFullscreen = false;
//      fs.leave();
    }
    else if (menu.optBtn[2].isOver())//SOUNDS ON
      sounds.unmuteAll();
    else if (menu.optBtn[3].isOver())//SOUNDS OFF
     sounds.muteAll();
    else if (menu.backBtn1.isOver())//BACK
      if (gameIsStarted)
        STATE = PAUSE;
      else
        STATE = START;
    break;
  case RESTART: 
    if(menu.restartBtn[0].isOver()){//NEXT LEVEL
      STATE = COUNTDOWN;
      level +=1;
      newGame(level);
    }
    else if (menu.restartBtn[1].isOver())// GO BACK TO MENU
      STATE = PAUSE;
    break;
  case GAMEOVER:  
    level = 1;
    if(menu.gameOverBtn[0].isOver()){
      STATE = PLAYING;      
      newGame(level);
      space.Lives = MAX_LIVES;
      space.destr = false;
      alasers.removeAll(alasers);
      lasers.removeAll(lasers);
    }
    else if (menu.gameOverBtn[1].isOver()){
      STATE = PAUSE;      
    }
    break;
  case PLAYING:
//    if (mouseButton == RIGHT){
//        if (bombs.size() == 0 && bombsCount > 0) {
//          bombs.add(new Bomb(space.sX+13,space.sY));
//          bombsCount--;
//          
//        } else if( bombs.size() != 0)   
//          ((Bomb)bombs.get(0)).expand = true;
//    }
    if (mouseButton == LEFT){
      if (lasers.size()<maxLasers){
        lasers.add( new Laser(space.sX + 13, space.sY) );
        score-=2; 
      }
    }
    break;

  case INSTRUCTIONS:
    if (instructions.backBtn.isOver()){
      if (gameIsStarted)
        STATE = PAUSE;
      else
        STATE = START;
    }
    break;
  case RUSURE:
    if (menu.RUSureBtn[0].isOver()){
      if (Lives<MAX_LIVES)
        Lives = MAX_LIVES;
      isStarted = true;
      STATE = COUNTDOWN;
      level = 1;
      bombsCount = 3;
      newGame(level);
    }
    else if(menu.RUSureBtn[1].isOver()){
      STATE = PAUSE;
    }
    break;
     case RUSURE2:
    if (menu.RUSureBtn[0].isOver()){
      exit();
    }
    else if(menu.RUSureBtn[1].isOver()){
       if (gameIsStarted)
        STATE = PAUSE;
      else
        STATE = START;
    }
    break;
  }
}

boolean sketchFullScreen() {
  return isFullscreen;
}
//=========================================================================================================================
void mouseMoved(){
  switch(STATE){
  case PAUSE:
    for (i = 0 ;i<menu.NUMBER_OF_BUTTONS;i++){
      menu.btn[i].isOver();
    }
    break;
  case OPTIONS: 
    for(i = 0; i<menu.NUMBER_OF_OPTION_BUTTONS;i++){
      menu.optBtn[i].isOver();
    }
    menu.backBtn1.isOver();
    break;
  case RESTART:
    for (i =0; i<menu.NUMBER_OF_RESTART_BUTTONS;i++){
      menu.restartBtn[i].isOver();
    }
    break;
  case GAMEOVER:
    for (i = 0; i<menu.NUMBER_OF_GAMEOVER_BUTTONS;i++){
      menu.gameOverBtn[i].isOver();
    }
    break;
  case INSTRUCTIONS:
    instructions.backBtn.isOver();
    break;
  case RUSURE:
    menu.RUSureBtn[0].isOver();
    menu.RUSureBtn[1].isOver();
    break;
  case RUSURE2:
    menu.RUSureBtn[0].isOver();
    menu.RUSureBtn[1].isOver();
    break;
      
  }
}
//==========================================================================================================================
//==========================================================================================================================
//==========================================================================================================================
//==========================================================================================================================
void newGame(int level){
  if (level%2 == 0)
  bombsCount+=1;
  lasers.removeAll(lasers);
  alasers.removeAll(alasers);
  if (level == 1){
 alienSpeed = 1;
    score = 0;
  }
  instructions = new Instructions();
  //******************************************STARS**************************************************************************
  for (i =0 ; i <num;i++)
  {
    star[i] = new Star(random (width),random (height),random (1,4),random(0,255));
  }
  //******************************************ALIENS*************************************************************************
  if (!aliens.isEmpty()){
    aliens.removeAll(aliens);
    alienCount = 0;
  }
  if(aliens.isEmpty())
    aliens.AddNewWave(level);
  credits = new Credits();
  cDown = new CountDown(level);
  if(!bombs.isEmpty())
  bombs.removeAll(bombs);
  //********************************************BUTTONS************************************************************************
  menu = new Menu();
  instructions.init();
  menu.init();
}
//==========================================================================================================================
//==========================================================================================================================
//==========================================================================================================================
//==========================================================================================================================
void game(){
  sounds.menusound.rewind();
  sounds.menusound.pause(); 
  if (!sounds.mainBgSound.isPlaying()){
    sounds.mainBgSound.loop(); 
  }
  noCursor();
  background(0);
  gui.RenderGui();
  space.display();// kalw thn display method apo thn space class
  for (i = 0;i<num;i++)
  {
    star[i].display();
    star[i].move();
  }
  // move lasers
  for (i = 0; i<lasers.size();i++){
    Laser laser = (Laser)lasers.get(i);    
    int score_of_target = laser.Move(aliens);    
    if (score_of_target > 0 || !laser.intheworld() )
      lasers.remove(laser);
    else 
      laser.display();
    score += score_of_target;
  }
//  // move bombs
//  for(i =0;i<bombs.size();i++){
//    Bomb bomb = (Bomb) bombs.get(i);  
//    if (bomb.expand){
//      bomb.Collide(aliens);  
//      bomb.Expand();
//    }
//
//    else
//      bomb.Move();
//    bomb.display();
//
//    if(!bomb.inTheWorld() || bomb.radius>100){
//      bombs.remove(bomb);
//    }
//  }
  
  aliens.Move();
  aliens.Display();

  if (alienCount<=0){
    sounds.mainBgSound.pause();
    STATE = RESTART;
  }
  space.sX =constrain( mouseX,0,width-30);
  alienSize = aliens.size();  
  maxAlasers = aliens.size();
  if ( alasers.size() < maxAlasers && ceil(random(0,60))%mod == 0 && !aliens.isEmpty()) {
    alienRand = ceil(random(0,alienSize-1));        
    Alien ali = (Alien)aliens.get(alienRand);
    alasers.add(ali.shoot());
    sounds.alaserSound(sounds.soundrand);
  }               
  for (i = 0; i <alasers.size();i++){
    Alaser alaser = (Alaser)alasers.get(i);
    alaser.move();
    if (alaser.collide(space.sX,space.sY)){
      sounds.spaceDestruct.trigger();
      space.destroy();
      alasers.removeAll(alasers);
      lasers.removeAll(lasers);
      STATE = LIFELOST;
      alasers.remove(alaser);
    }
    else if (!alaser.intheworld()) {
      alasers.remove(alaser);
      sounds.soundrand = ceil(random(-1,8));
    }
    else
    {
      alaser.display();
    }    
  }
  if (space.Lives<=0)
    STATE = GAMEOVER;
}
//==========================================================================================================================
//==========================================================================================================================
//==========================================================================================================================
//==========================================================================================================================
