class Space{// onoma toy class
  float sX;// orizw thn thesh toy x
  float sY;// orizw thn thesh toy y
  float sSpeed = 5;
  int numL = 1;
  //boolean disp = true;
  boolean destr = false;
  int Lives =5;
  float d = 0;
  int introDirection = -1;


  Space(float spX,float spY){// dhmiourgw ton constructor
    sX = spX;
    sY = spY;
  }

  void MoveLeft() {
    sX = min( sX + sSpeed, width-25);       
  }

  void MoveRight() {
    sX = max( sX - sSpeed, 0 );
  }

  void display(){// kathorizw thn method display

      if (!destr)
      RenderSpace(sX,sY);
    else 
      RenderExplosion();


  }
  void RenderExplosion(){

    fill (0);
    rect (-10,-10,width+10,height+10);
    fill(255);
    text("Lives Left : "+Lives,width/2-70,height/2);
    float sdX = width/2;
    float sdY = height/2+100;
    //if (millis()/1000 % 1==0){
    //float d = millis()/1000 % 10;     
    if ((millis()-startTime)/250 >=1){   
      startTime = millis();
      d++;
    }

    //d*=2;
    rect(sdX+12,sdY+10-d,1,1);
    rect(sdX+11-d,sdY+11-d,1,1);
    rect(sdX+13+d,sdY+11-d,1,1);
    rect(sdX+10-d,sdY+12,1,1);
    rect(sdX+12+d,sdY+12,1,1);
    rect(sdX+14+d,sdY+12,1,1);
    rect(sdX+11-d,sdY+13+d,1,1);
    rect(sdX+13+d,sdY+13+d,1,1);
    rect(sdX+12,sdY+14+d,1,1);


    if (d > 10){
      destr = false;
      STATE = PLAYING;
      d = 0;
    }


  }
  void RenderSpace(float sX, float sY)
  {
    //rotate(-PI/2);
    beginShape();
    strokeWeight(0);
    fill(255);
    rect(sX+12,sY,1,1);
    rect(sX+12,sY+1,1,1);    
    rect(sX+11,sY+2,3,1);    
    rect(sX+11,sY+3,3,1);    
    rect(sX+11,sY+4,3,1);    
    rect(sX+11,sY+5,3,1);    
    rect(sX+9,sY+6,7,1);    
    rect(sX+8,sY+7,9,1);    
    rect(sX+7,sY+8,11,1);
    rect(sX+6,sY+9,13,1);   
    rect(sX+5,sY+10,15,1);
    rect(sX+4,sY+11,17,1);
    rect(sX+3,sY+12,8,1);
    rect(sX+14,sY+12,8,1);   
    rect(sX+2,sY+13,8,1);
    rect(sX+11,sY+13,3,1);
    rect(sX+15,sY+13,8,1);
    rect(sX+1,sY+14,1,1);
    rect(sX+3,sY+14,4,1);
    rect(sX+11,sY+14,3,1);
    rect(sX+18,sY+14,4,1);
    rect(sX+23,sY+14,1,1);
    rect(sX+11,sY+15,3,1);
    rect(sX+11,sY+16,3,1);
    rect(sX+11,sY+17,3,1);
    rect(sX+11,sY+18,3,1);
    rect(sX+10,sY+19,4,1);
    rect(sX+9,sY+21,1,1);
    rect(sX+12,sY+12,1,1);
    rect(sX+15,sY+21,1,1);
    rect(sX+8,sY+22,1,1);
    rect(sX+12,sY+22,1,1);
    rect(sX+16,sY+22,1,1);
    rect(sX+7,sY+23,1,1);
    rect(sX+12,sY+23,1,1);
    rect(sX+17,sY+23,1,1);
    rect(sX+6,sY+24,13,1);
    endShape();
  }
  void introMove(){
    sX+= sSpeed * introDirection;
  }

  void introDisplay(){
    //float x = degrees(-PI/2);
    //rotate (x);
    beginShape();
    strokeWeight(0);
    fill(255);
    rect(sX+12,sY,1,1);
    rect(sX+12,sY+1,1,1);    
    rect(sX+11,sY+2,3,1);    
    rect(sX+11,sY+3,3,1);    
    rect(sX+11,sY+4,3,1);    
    rect(sX+11,sY+5,3,1);    
    rect(sX+9,sY+6,7,1);    
    rect(sX+8,sY+7,9,1);    
    rect(sX+7,sY+8,11,1);
    rect(sX+6,sY+9,13,1);   
    rect(sX+5,sY+10,15,1);
    rect(sX+4,sY+11,17,1);
    rect(sX+3,sY+12,8,1);
    rect(sX+14,sY+12,8,1);   
    rect(sX+2,sY+13,8,1);
    rect(sX+11,sY+13,3,1);
    rect(sX+15,sY+13,8,1);
    rect(sX+1,sY+14,1,1);
    rect(sX+3,sY+14,4,1);
    rect(sX+11,sY+14,3,1);
    rect(sX+18,sY+14,4,1);
    rect(sX+23,sY+14,1,1);
    rect(sX+11,sY+15,3,1);
    rect(sX+11,sY+16,3,1);
    rect(sX+11,sY+17,3,1);
    rect(sX+11,sY+18,3,1);
    rect(sX+10,sY+19,4,1);
    rect(sX+9,sY+21,1,1);
    rect(sX+12,sY+12,1,1);
    rect(sX+15,sY+21,1,1);
    rect(sX+8,sY+22,1,1);
    rect(sX+12,sY+22,1,1);
    rect(sX+16,sY+22,1,1);
    rect(sX+7,sY+23,1,1);
    rect(sX+12,sY+23,1,1);
    rect(sX+17,sY+23,1,1);
    rect(sX+6,sY+24,13,1);
    endShape();
  }


  void displayLives(){

    //for(int i = 0; i < space.Lives;i++)
    //RenderSpace((width/2-120)+50*i,height - 50);
  }
  void destroy(){
    destr = true;
    Lives-=1;
  }
}






