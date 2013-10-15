class Star{

  float starX;
  float starY;
  float starSpeed;
  float light;

  Star (float xPos, float yPos,float starS, float bright){
    starX = xPos;
    starY = yPos;
    starSpeed = starS;
    light = bright;
  }
  void display(){
    strokeWeight(1);
    stroke(255,light);
    point (starX,starY);
  }

  void move(){

    starY+=starSpeed;
    if (starY>height){
      starY = 0;
    }
  }
}



