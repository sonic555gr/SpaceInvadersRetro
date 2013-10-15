class Bonus{
  float bonX;
  float bonY;
  float bonS=3;
  float radius = 13;
  boolean alive = true;
  Bonus(float bonX,float bonY){
    this.bonX = bonX;
    this.bonY = bonY;
  }
  void display(){
    RenderBomb();
  }
  
  void RenderBomb(){
    stroke(255);
    fill(255);
    ellipse (bonX,bonY,radius,radius);
    rect(bonX-3,bonY-3,6,8);
  }
  
  
  void move(){
    bonY+=bonS;
  }

  boolean Collision(float tarX,float tarY){
      return sq(tarX-bonX)+sq(tarY-bonY)<sq(radius+13);    
}

  boolean inTheworld(){
    return bonX<width && bonX>0 && bonY<height && bonY>0;
  }
}
