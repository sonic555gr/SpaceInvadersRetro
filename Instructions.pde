class Instructions{
  int  textX = 100;
  int  textY = 70;
 Button backBtn;

  Instructions(){
  }
  void display(){
    fill(0);
    rect(-10,-10,width+10,height+10);
    fill(255);
    textSize(70);
    text("Space Invaders Retro",textX+130,textY);
    textSize(40);
    text("Instructions",textX+260,textY+100);
    textSize(32);
    text("A Simple and almost easy Space Invaders game.",textX+130,textY+150);
    rect (textX,textY+185,10,10);
    text(" Try to shoot the Alien Invaders by pressing the \"B\" key on you Wiimote. ",textX+30,textY+200);
    rect (textX,textY+235,10,10);
    text("The \"A\" button throws a Bomb press it again to make the bomb go off",textX+30,textY+250);
    text("You have a really limited amount of bombs so, don't waste them",textX+30,textY+300);
    rect (textX,textY+335,10,10);
    text(" Rotating your Wiimote left and right will eventualy move your spaceship, left and right.",textX+30,textY+350 );
    rect (textX,textY+385,10,10);
    text(" The button Labeled as \"Home\" will open up the menu screen and return ",textX+30,textY+400);
    text(" you to the game.",textX+30,textY+450);
    rect (textX,textY+485,10,10);
    text(" The \"up\" an \"down\" arrows configure the volume of the sound. ",textX+30,textY+500);
    text("I certainly hope that you have a really nice time with this!!! Enjoy",textX+30,textY+550);
    
    backBtn.display();
  }
  void init(){
     backBtn = new Button(width-100,height-100,"Back");
  }
}


