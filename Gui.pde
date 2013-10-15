class Gui{
  int remLasers;
  Gui(){
  }

  void RenderGui(){
    textSize(32);
    score();

    lasersRemaining();
    highScore();
    lives();
    AliensRemaining();
    BombsRemaining();
    currentLevel();
  }
  void AliensRemaining(){
    text("Aliens Remaining : "+alienCount,width-300,height-20);
  }
  void lives(){
    space.RenderSpace(width/2-200,height-50);
    text("X"+space.Lives,width/2-150,height-20); 
  }
  void highScore (){
    if (score>highScore)
      highScore = score;
    text("High Score : "+highScore,width-300,35);
  }
  void lasersRemaining(){
    remLasers = maxLasers - lasers.size();
    if (remLasers<0)
      remLasers = 0;
    text("Lasers Remaining : "+remLasers,30,height-20);
  }

  void score(){
    if (score<0)
      score = 0;
    text("Player : "+score,30,35);
  }


  void BombsRemaining(){
    text("Bombs :"+bombsCount,30,height-50);


  }
  void currentLevel(){
    text("Level :  "+level,width/2-300,35);
  }
}







