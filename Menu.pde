class Menu{
  static final int NUMBER_OF_BUTTONS=6;
  static final int NUMBER_OF_OPTION_BUTTONS = 4;
  static final int NUMBER_OF_RESTART_BUTTONS = 2;
  static final int NUMBER_OF_GAMEOVER_BUTTONS = 2;
  Button[] btn = new Button[NUMBER_OF_BUTTONS];
  Alien menuAlien;
  Button[] optBtn = new Button[NUMBER_OF_OPTION_BUTTONS];
  Button[] restartBtn = new Button[NUMBER_OF_RESTART_BUTTONS];
  Button[] gameOverBtn = new Button[NUMBER_OF_GAMEOVER_BUTTONS];
  Button[] RUSureBtn = new Button[2];
  Button backBtn1;
  Slider slider;
  Slider slider2;

  Menu(){
  }
  void init(){
    btn[1] = new Button(width/2-50, 250, "Resume");
    btn[0] = new Button(width/2-50, 300, "New Game");
    btn[4] = new Button(width/2-50, 400, "Options");
    btn[5] = new Button(width/2-50, 350, "Instructions");
    btn[2] = new Button(width/2-50, 450, "Credits");
    btn[3] = new Button(width/2-50, 500, "Exit");
    //menuAlien = new Alien


    optBtn[0] = new Button(width-200, height/2-100, "Yes");
    optBtn[1] = new Button(width-100, height/2-100, "No");
    optBtn[2] = new Button(width-200, height/2-150, "On");
    optBtn[3] = new Button(width-100, height/2-150, "Off");
    slider = new Slider(height/2-70);
    slider2 = new Slider(height/2-20);


    restartBtn[0] = new Button(width-200, height/2-100, "Next");
    restartBtn[1] = new Button(width-100, height/2-100, "Exit");

    gameOverBtn[0] = new Button(width-200, height/2-100, "Yes");
    gameOverBtn[1] = new Button(width-100, height/2-100, "No");
    backBtn1 = new Button(width-100,height-100, "Back");
    RUSureBtn[0] = new Button(width-200, height/2-100, "Yes");
    RUSureBtn[1] = new Button(width-100, height/2-100, "No");
  }

  void gamePaused(){
    sounds.mainBgSound.rewind();
    sounds.mainBgSound.pause();
    if(!sounds.menusound.isPlaying())
      sounds.menusound.loop();
    cursor(ARROW);
    fill(0);
    rect(-10,-10,width+10,height+10);
    for(int i = 0 ;i<NUMBER_OF_BUTTONS;i++){
      btn[i].display();
    }
textSize(60);
    text ("SPACE INVADERS RETRO",320,130);

    //noLoop();
    fill(255);
    textSize(37);
    //textAlign(LEFT);

    text("Game Paused",width/2-70,40);
  }
  void lifeLost(){
    space.display();
  }
  void gameOver(){
    fill(0);
    rect(-10,-10,width+10,height+10);
    cursor(ARROW);
    fill(255);
    textSize(50);
    text("GAME OVER",width/2-80,height/2-height/3);
    textSize(32);
    text ("Do you want to play again? (All Progress will be lost) :",200,height/2-100);
    for (i =0;i<NUMBER_OF_GAMEOVER_BUTTONS;i++){
      gameOverBtn[i].display();
      gameIsStarted = false;
    }
  }
  void options(){
    fill(0);
    rect(-10,-10,width+10,height+10);
    fill(255);
    text("FullScreen mode   : ",200,height/2-100);
    text("Sounds            : ",200,height/2-150);
    text("Music Volume      : ",200,height/2-50);
    text("AFX Volume        : ",200,height/2);
    for(int i =0;i < NUMBER_OF_OPTION_BUTTONS;i++){
      optBtn[i].display();
    }
    backBtn1.display();
    slider.display();
    slider2.display();
    //slider.mouseOver();
  }
  void restart(){
    cursor(ARROW);
    fill(0);
    rect(-10,-10,width+10,height+10);
    fill(255);
    textSize(45);
    text("YOU WIN",width/2-50,height/2-300);
    textSize(50);
    text("Score: "+score,width/2-60,height/2-200);
    textSize(32);
    text("Next Level?",100,height/2-100);

    for( i = 0 ;i<NUMBER_OF_RESTART_BUTTONS;i++){
      restartBtn[i].display();
    }
  }
  void startScreen(){
    sounds.mainBgSound.rewind();
    sounds.mainBgSound.pause();
    if(!sounds.menusound.isPlaying())
      sounds.menusound.loop();
    cursor(ARROW);
    fill(0);
    rect(-10,-10,width+10,height+10);
    fill(255);
    textSize(60);
    text ("SPACE INVADERS RETRO",320,130);
    for(int i = 0 ;i<NUMBER_OF_BUTTONS;i++){
      if (i == 1)
        continue;
      btn[i].display();
    }

  }
  void areYouSureScreen(){
    cursor(ARROW);
    textSize(32);
    fill(0);
    rect(-10,-10,width+10,height+10);
    fill(255);
    text("Are you sure you want to start a New Game ?",200,height/2-100); 

    for(i = 0; i <2;i++){
      RUSureBtn[i].display();
    }
  }
     void areYouSureScreen2(){
    cursor(ARROW);
    textSize(32);
    fill(0);
    rect(-10,-10,width+10,height+10);
    fill(255);
    text("Are you sure you want to Exit ?",200,height/2-100); 

    for(i = 0; i <2;i++){
      RUSureBtn[i].display();
    }
  }
  




}

