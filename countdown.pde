class CountDown{
  int level;
  int time;
  int x=0;
  CountDown(int level){
    this.level = level;
  }
  void display(){
    renderTimer();
  }
  void renderTimer(){
    fill(0);
    rect(-10,-10,width+10,height+10);
    fill(255);
    textSize(50);
    if ((millis()-startTime)/1000 >=1){   
      startTime = millis();
      x++;
    }
    switch(x){
     case 1 :     
      text("Level "+level,width/2-30,height/2);     
      break;
      case 2 :
      text("3",width/2,height/2);
      break;
    case 3 :
      text("2",width/2,height/2);
      break;
    case 4 :
      text("1",width/2,height/2);
      break;
    case 5 :
      text("Go!",width/2-10,height/2);
      break;   
    case 6:
      STATE = PLAYING ;
      break;
    }
    if (x > 6)
      x = 0;
  }
}





