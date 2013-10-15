class Intro{
  float aX = 20;
  float aY = 30;
  float lX = width-100;
  float lY = height/2;
  float introSX = width+50;
  float introSY = height/2;
  float introAX = -50;
  float introAY = height/2;
  Aliens introAliens = new Aliens();
  Alien al;
  Alien introAlien;
  Space introSpace;
  Laser introLaser;

  static final int SCENE1 = 101;
  static final int SCENE2 = 102;
  static final int SCENE3 = 103;
  static final int SCENE4 = 104;
  static final int SCENE5 = 105;
  static final int SCENE6 = 106;
  static final int SCENE7 = 107;
  int INTROSTATE = SCENE1;
  Intro(){
  }



  void display(){
    switch (INTROSTATE){
    case SCENE1:
      Scene1();
      //animateSpace();
      break;
    case SCENE2:
      Scene2();
      break;
    case SCENE3:
      break;
    case SCENE4:
      break;
    case SCENE5:
      break;
    case SCENE6:
      break;
    case SCENE7:
      break;
    }
    //    cursor(ARROW);
    //    fill(0);
    //    rect(-10,-10,width+10,height+10);
    //    fill(255);
    //    stroke(255);
    //    animateAliens();
    //    animateSpace();
    //    animateLaser();
    //    // animateSpace();
    //    //animateLaser();
    //    //if (lX <= aX+30)
    //    //STATE = OPTIONS;

  }
  void animateAliens(){

    //for (int i = 0;i<introAliens.size();i++){
    //al = (Alien)introAliens.get(i);
    //al.move();
    // al.display();
    //}
  }

  void animateLaser(){
    stroke(255);
    fill (255);
    strokeWeight(1);
    //line ();
    lX -= 0.5;  
  }
  void animateSpace(){
    //scale(1);
    //rotate(-PI/2);
    //translate (width/2+width/4,height/2);

    introSpace.display();

  }
  void init(){
    //rotate(-PI/2);
    //translate(introSX,introSY);
    introSpace = new Space(-12.5,-12.5);

    introAlien = new Alien(-50,height/2,1);
    introAliens.AddNewWave(100);
    introLaser = new Laser(introSpace.sX,introSpace.sY);
  }


  void Scene1(){


    fill(0);
    rect (-10,-10,width+10,height+10);
    fill(255);

    if (introSpace.sX>width/2+width/4)
      introSpace.introMove();
    if(introSpace.sX<= width/2+width/4 && introLaser.X>=introAlien.aX+25 && introLaser.Y>=introAlien.aY)
      introLaser.introMove();

    if (introAlien.aX<width/2-width/4)
      introAlien.introMove();

    //rotate(PI/2);
    //translate(100,200);


     rotate(-PI/2);
     translate(width+50,height/2);
    introSpace.introDisplay();
     
      
    //translate(-50,height/2);
    introAlien.display();
    introLaser.display();




  }
  void Scene2(){
    //Scene1();
    introSpace.display();
    if (introAlien.aX<width/2-width/4)
      introAlien.introMove();
    introAlien.display();
  }


}








