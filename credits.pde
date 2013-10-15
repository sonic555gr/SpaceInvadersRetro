class Credits{
  float Xpos = 30;
  float Ypos = height-50;
  Credits(){
  }
  void display(){
  move();
  RenderCredits();
  }
  void move(){
    Ypos -= 1;
    if (Ypos+600 <= 0){
      STATE = PAUSE;
      Xpos =30;
      Ypos = height-100;
    }
  }
void RenderCredits(){
  
    fill(0);
    rect (0,0,width,height);
    fill(255);
    textAlign(LEFT);
    textSize(60);
    text("SPACE INVADERS RETRO",Xpos,Ypos-20);
    textSize(32);
    text("LEAD GRAPHICS & PROGRAMMING",Xpos,Ypos+90);
    text("Alkiviadis Papadakis",Xpos,Ypos+140);
    text("SOUNDS CREATOR AND SAMPLING",Xpos,Ypos+210);
    text("Giwrgos Papadakis",Xpos,Ypos+260);
    text("SPECIAL THANKS",Xpos,Ypos+330);
    text("My mother (For her assistance and patience with me!)",Xpos,Ypos+390);
    text("Nick Valeontis (Coding assistance)",Xpos,Ypos+440);
    text("Kostas Katsifis (For his great promotion)",Xpos,Ypos+490);
    text("IEK DOMI (For the same reasons)",Xpos,Ypos+540);
    text("My neighbor (For his doormat which gave me the idea)",Xpos,Ypos+590);        
}  
}


