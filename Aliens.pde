class Aliens extends ArrayList {
  Alien al;
  int randGroup;
  int maxAliens;
  float mod = 1;
  void Move() {
    boolean out = false;

    for( int i = 0; i < size(); i++) {
      al = (Alien) get(i);

      if (al.aX<0 || al.aX+30 > width){
        out = true;
        break;
      }
    }

    if (out)
      ChangeDirection();

    for( int i = 0; i < size(); i++) {
      al = (Alien) get(i);
      al.move(mod);


    }

  }

  void Display() {
    for( int i = 0; i < size(); i++) {
      al  = (Alien) get(i);
      al.display();
    }    
  }

  void ChangeDirection() {
    for( int i = 0; i < size(); i++) {
      al  = (Alien) get(i);
      al.direction = -al.direction;          
    }        
    MoveDown();
  }

  void MoveUp() {
    for( int i = 0; i < size(); i++) {
      al  = (Alien) get(i);
      al.aY -= 10;
    }        
  }

  void MoveDown() {
    for( int i = 0; i < size(); i++) {
      al  = (Alien) get(i);
      al.aY += 15;
    }        
  }

  void MoveRight() {
    for( int i = 0; i < size(); i++) {
      al  = (Alien) get(i);
      al.aX += 10;
    }        
  }  

  void MoveLeft() {
    for( int i = 0; i < size(); i++) {
      al  = (Alien) get(i);
      al.aX -= 10;
    }        
  }    

  void AddSquareGroup() {
    float aX = width/2-width/4+200;
    float aY = 20;

    for (i = 0; i < 8;i++,aY+=50){
      aX = width/2-width/3-50;
      for (j =0; j<8;j++){  
        add(new Alien(aX,aY,alienSpeed));
        aX+=50;
        alienCount+=1;
      }
    }
    maxAliens = alienCount;
  }

  void AddRectangleGroup() {
    float aX = width/2-width/4;
    float aY = 20;

    for (i = 0; i < 6;i++,aY+=50){
      aX = width/2-width/3-50;
      for (j =0; j<15;j+=1){  
        add(new Alien(aX,aY,alienSpeed));
        aX+=50;
        alienCount+=1;
      }
    }
    maxAliens = alienCount;
  }
  void AddMyGroup(){

    aY = 50;
    add(new Alien(300,aY,alienSpeed));
    add(new Alien(350,aY,alienSpeed));
    add(new Alien(650,aY,alienSpeed));
    add(new Alien(700,aY,alienSpeed));
    add(new Alien(750,aY,alienSpeed));
    add(new Alien(800,aY,alienSpeed));
    add(new Alien(850,aY,alienSpeed));
    aY = 100;
    add(new Alien(300,aY,alienSpeed));
    add(new Alien(350,aY,alienSpeed));
    add(new Alien(650,aY,alienSpeed));
    add(new Alien(700,aY,alienSpeed));
    add(new Alien(850,aY,alienSpeed));
    add(new Alien(900,aY,alienSpeed));
    aY = 150;
    add(new Alien(250,aY,alienSpeed));
    add(new Alien(400,aY,alienSpeed));
    add(new Alien(650,aY,alienSpeed));
    add(new Alien(700,aY,alienSpeed));
    add(new Alien(750,aY,alienSpeed));
    add(new Alien(800,aY,alienSpeed));
    add(new Alien(850,aY,alienSpeed));
    aY = 200;
    add(new Alien(250,aY,alienSpeed));
    add(new Alien(300,aY,alienSpeed));
    add(new Alien(350,aY,alienSpeed));
    add(new Alien(400,aY,alienSpeed));
    add(new Alien(650,aY,alienSpeed));
    add(new Alien(700,aY,alienSpeed));
    aY = 250;
    add(new Alien(200,aY,alienSpeed));
    add(new Alien(250,aY,alienSpeed));
    add(new Alien(300,aY,alienSpeed));
    add(new Alien(350,aY,alienSpeed));
    add(new Alien(400,aY,alienSpeed));
    add(new Alien(450,aY,alienSpeed));
    add(new Alien(650,aY,alienSpeed));
    add(new Alien(700,aY,alienSpeed));
    aY = 300;
    add(new Alien(200,aY,alienSpeed));
    add(new Alien(450,aY,alienSpeed));
    add(new Alien(650,aY,alienSpeed));
    add(new Alien(700,aY,alienSpeed));
    aY = 350;
    add(new Alien(150,aY,alienSpeed));
    add(new Alien(500,aY,alienSpeed));
    add(new Alien(550,aY,alienSpeed));
    add(new Alien(600,aY,alienSpeed));
    add(new Alien(650,aY,alienSpeed));
    add(new Alien(700,aY,alienSpeed));
    alienCount  = 44;
    maxAliens = alienCount;  
  }
  void AddTriangleGroup(){
    aX=width/2-width/4-50;
    aY=50;
    for (i = 0; i<7;i++){
      aY+=50;
      aX = width/2-width/4;
      for (j =0; j<13;j++){
        add(new Alien(aX,aY,alienSpeed));
        aX+=50;
       
          alienCount+=1;
      }
    }
    maxAliens = alienCount;
  }


  void AddIntroGroup(){

  }
  void AddRandomGroup(){
    randGroup = ceil(random(50,150-1));
    for ( i = 0;i < randGroup;i++){
      add(new Alien(random(50,width-50),random(50,height/3),alienSpeed));
      alienCount+=1;

    }
    maxAliens = alienCount;
  }

  void AddNewWave( int level ) {
    if (level%3==0){
      alienSpeed+=0.5;
    }
    switch(level) {
    case 1:
    case 5:    
    case 9:
    case 13:
    case 17:
      AddMyGroup();
      break;
    case 2:
    case 6:
    case 10:
    case 14:
    case 18:  
      AddSquareGroup();
      break;
    case 3:
    case 7:
    case 11:
    case 15:
    case 19:
      AddRectangleGroup();
      break;
    case 4:
    case 8:
    case 12:
    case 16:
    case 20:
      AddTriangleGroup();
      break;
    case 100:
      AddIntroGroup();
      break;
   // default :
      //AddRandomGroup();
      //break;


    }
  }
}





