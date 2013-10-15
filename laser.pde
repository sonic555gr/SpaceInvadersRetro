class Laser{
  float X;
  float Y;
  float S = -8;    // speed
  float P = 1;     // power
  boolean col  = true;
  int dir = 1;
  int introDirection = -1;
  float radius = 5;
  Laser (float X,float Y){
    this.X = X;
    this.Y = Y;
  }
  void display(){
    RenderLaser(); 
  }
  void RenderLaser(){
    stroke(255);
    fill (255);
    strokeWeight(P);
    line (X,Y,X,Y-10);
    //ellipse(X,Y-radius,radius,radius);
  }  
  boolean intheworld() {
    return (Y < height) && (Y > 0) && (X > 0) && (X < width);
  }
  int Move(ArrayList aliens){        // returns score
    int score = 0;
    Y += S * dir;
    for (int i = 0; i<aliens.size();i++){
      Alien al = (Alien)aliens.get(i);
      if(X>al.aX && X<al.aX+20 && abs((Y-10)-(al.aY+20))<4.5){
        al.health-=1;
        score = al.getScore();
        if (al.health<=0){
          sounds.soundrand = ceil(random(0,4));
          sounds.killAlienSound(sounds.soundrand);
          al.destroy();
          al.display();
          score = al.getScore();
          aliens.remove(al);
          alienCount-=1;
        }
      }
    }
    return score;
  } 
  void introMove(){
    X+=S*introDirection;
  }
}















