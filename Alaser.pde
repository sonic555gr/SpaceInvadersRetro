class Alaser{
  float alX; 
  float alY;
  float alS=6;
  float radius = 5;


  Alaser(float alX,float alY){
    this.alX = alX;
    this.alY = alY;
  }

  void display(){
    RenderAlienLaser();
  }

  void RenderAlienLaser(){
    fill(255);
    stroke(255);
    strokeWeight(1);
    
    line(alX,alY,alX,alY+10);
    line(alX+1,alY,alX+1,alY+10);
    
  }

  void move(){
    alY+=alS;

  }

  boolean collide(float sX, float sY){
    return (  (alX>sX && alX<sX+25) && (abs((alY+10)-(sY+25))<3.75) );
  }


  boolean intheworld() {
    return (alY+10 < height) && (alY > 0) && (alX > 0) && (alX < width);
  }
}













