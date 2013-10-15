class Alien {
  float aX;
  float aY;
  float aS;
  float mod = 1;
  boolean destr =false;
  int health;
  float rad = 12;
  //boolean move = false;
  float direction =1;
  int score = 20;
  Alaser alaser;
  float introDirection = 1;
  boolean alive = true;
  int d;


  //ArrayList alasers = new ArrayList();


  Alien (float aX,float aY,float aS){
    this.aX = aX;
    this.aY = aY;
    this.aS = aS;
  }



  void display(){
    if (!destr)
      RenderAlien();
    else
      RenderExplosion();
  }

  void move(float mod){

    aX+=(aS*mod)*direction;
    if (aY>height)
      STATE = GAMEOVER;
  }  




  void destroy(){
    destr = true; 
  }
  void RenderAlien(){
    d = millis()/250%2;
    fill (255);
    switch(d){
    case 0:

      strokeWeight(0);
      rect(aX+4,aY,12,2);//             ******    
      rect(aX+4,aY+2,2,2);//            * ** *    
      rect(aX+8,aY+2,4,2);//            ******
      rect(aX+14,aY+2,2,2);//          ********
      rect(aX+4,aY+4,2,12);//         * ****** *
      rect(aX+2,aY+6,16,2);//         * ****** *
      rect(aX,aY+8,2,2);//              ******
      rect(aX+4,aY+8,12,2);//            *  *
      rect(aX+18,aY+8,2,2);//           *    *
      rect(aX,aY+10,2,2);//           ***    ***
      rect(aX+4,aY+10,12,2);
      rect(aX+18,aY+10,2,2);
      rect(aX+4,aY+12,12,2);
      rect(aX+6,aY+14,2,2);
      rect(aX+12,aY+14,2,2);
      rect(aX+4,aY+16,2,2);
      rect(aX+14,aY+16,2,2);
      rect(aX,aY+18,6,2);
      rect(aX+14,aY+18,6,2);  
      break;
    case 1:

      strokeWeight(0);
      rect(aX+4,aY,12,2);

      rect(aX,aY+2,2,2);//          ******
      rect(aX+4,aY+2,2,2);//      * * ** * *
      rect(aX+8,aY+2,4,2);//      * ****** *
      rect(aX+14,aY+2,2,2);//      ********
      rect(aX+18,aY+2,2,2);//       ******
      rect(aX,aY+4,2,2);//          ******
      rect(aX+4,aY+4,2,12);//       ******
      rect(aX+18,aY+4,2,2);//      *      *
      rect(aX+2,aY+6,16,2);//     *        *
      rect(aX+4,aY+8,12,2);//     *        *
      rect(aX+4,aY+10,12,2);
      rect(aX+4,aY+12,12,2);
      rect(aX+2,aY+14,2,2);
      rect(aX+16,aY+14,2,2);
      rect(aX,aY+16,2,2);
      rect(aX+18,aY+16,2,2);
      rect(aX,aY+18,2,2);
      rect(aX+18,aY+18,2,2);
      break;
    }
  }
  void RenderExplosion(){
    rect (aX,aY,2,2);
    rect (aX+4,aY,2,2);
    rect (aX+8,aY,2,2);
    rect (aX+14,aY,2,2);
    rect (aX+18,aY,2,2);

    rect (aX+2,aY+2,2,2);
    rect (aX+8,aY+2,2,2);
    rect (aX+16,aY+2,2,2);

    rect (aX,aY+4,2,2);
    rect (aX+4,aY+4,2,2);
    rect (aX+8,aY+4,2,2);
    rect (aX+14,aY+4,2,2);

    rect (aX+6,aY+6,2,2);
    rect (aX+12,aY+6,2,2);

    rect (aX+8,aY+8,12,2);

    rect (aX,aY+10,12,2);

    rect (aX+6,aY+12,2,2);
    rect (aX+10,aY+12,4,2);

    rect (aX+4,aY+14,2,2);
    rect (aX+10,aY+14,2,2);
    rect (aX+14,aY+14,2,2);
    rect (aX+18,aY+14,2,2);

    rect (aX+2,aY+16,2,2);
    rect (aX+10,aY+16,2,2);
    rect (aX+16,aY+16,2,2);

    rect (aX+2,aY+18,2,2);
    rect (aX+4,aY+18,2,2);
    rect (aX+10,aY+18,2,2);
    rect (aX+14,aY+18,2,2);
    rect (aX+18,aY+18,2,2);
  }
  void introMove(){
    aX+=aS*introDirection;
  }
  boolean collide(){
    return aX>space.sX &&aX<space.sX+25 && aY>space.sY && aY<space.sY+25;
  }

  int getScore() {
    return score;
  }

  Alaser shoot() {
    return new Alaser(aX+13,aY+25);
  }

}



















