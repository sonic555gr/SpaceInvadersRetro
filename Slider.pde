class Slider{
  float startY;
  int rectFill = 255;
  int outerRectFill = 0;
  float mouse= map(sounds.menusound.getGain(),-40,5,width-300,width-100);
  float gain;
  Slider (float startY){

    this.startY = startY;       

  }
  void display(){
    RenderSlider();
  }
  void RenderSlider(){
    stroke (255);
    line (width-300,startY,width-100,startY);
    fill(outerRectFill);
    rect (width-310,startY,240,30);
    fill(rectFill);
    rect(mouse,startY,20,30);
  }
boolean mouseOver(){
return   mouseY<startY+30 && mouseY>startY && mouseX>mouse-20 && mouseX<mouse+20;
}
}

