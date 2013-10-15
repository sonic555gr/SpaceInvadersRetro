class Button {
  float btnX;
  float btnY;
  float btnW=120;
  float btnH=30;
  String btnS;
  int rectC = 0;
  int textC = 255;
  Alien buttonAlien1;
  Alien buttonAlien2;


  Button (float btnX,float btnY,String btnS){
    this.btnX = btnX;
    this.btnY = btnY;
    this.btnS = btnS;
  }

  void display(){
    textSize(35);
    stroke(0);
    //textAlign(CENTER);
    fill(rectC);
    btnW = textWidth(btnS);
    rect(btnX-10,btnY-30,btnW+20,btnH);
    buttonAlien1 = new Alien(btnX-40,btnY-25,0);
    buttonAlien2 = new Alien(btnX+btnW+20,btnY-25,0);
    fill(textC);
    text(btnS,btnX,btnY);
    if (isOver()){
      buttonAlien1.destr = false;
      buttonAlien1.display();
      buttonAlien2.destr = false;
      buttonAlien2.display();
    }

  }

  boolean isOver(){
    if (mouseX > btnX && mouseX <= btnX +(btnW+20) && mouseY > btnY-30 && mouseY < (btnY-30)+btnH){
      //mouseOverSound1.trigger();
      rectC=255;
      textC=0;

      return true;  
    }
    else{
      rectC = 0;
      textC = 255;
      return false;
    }


  }
}









