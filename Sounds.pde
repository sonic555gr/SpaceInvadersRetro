class Sounds{

AudioPlayer mainBgSound;//dilwnw ena antikeimeno Audioplayer
AudioPlayer menusound;
AudioSample spaceDestruct;
AudioSample mouseOverSound1;//mouseOver Sample
AudioSample[] killAlienSound= new AudioSample[5];//killAlien Sample
AudioSample[] alaserSound = new AudioSample[9];
int soundrand;
boolean isPlaying = false;
  Sounds(){
  }

  void init(){
   mainBgSound = minim.loadFile("Music.mp3",1024);
  menusound = minim.loadFile("starmusic.wav", 1024);
  mouseOverSound1 = minim.loadSample("Nonovirus2.wav");
  killAlienSound[0] = minim.loadSample("VPL3-2-1.wav", 1024);
  killAlienSound[1] = minim.loadSample("VPL3-2-1-1.wav", 1024);
  killAlienSound[2] = minim.loadSample("VPL3-3.mp3", 1024);
  killAlienSound[3] = minim.loadSample("VPL3-5.mp3", 1024);
  killAlienSound[4] = minim.loadSample("VPL3-7.mp3", 1024);
  alaserSound[0] = minim.loadSample("Oponent_LaserA1.mp3",1024);
  alaserSound[1] = minim.loadSample("Oponent_LaserA2.mp3",1024);
  alaserSound[2] = minim.loadSample("Oponent_LaserA3.mp3",1024);
  alaserSound[3] = minim.loadSample("Oponent_LaserA4.mp3",1024);
  alaserSound[4] = minim.loadSample("Oponent_LaserA5.mp3",1024);
  alaserSound[5] = minim.loadSample("Oponent_LaserB1.wav",1024);
  alaserSound[6] = minim.loadSample("Oponent_LaserB1 2.wav",1024);
  alaserSound[7] = minim.loadSample("Oponent_LaserB1 3.wav",1024);
  alaserSound[8] = minim.loadSample("Oponent_LaserB1 4.wav",1024);
  spaceDestruct = minim.loadSample("Death.mp3",1024);

  }
 void alaserSound(int x){
  alaserSound[x].trigger();
}
void killAlienSound(int y){
  killAlienSound[y].trigger();
}
void muteAll(){
  menusound.mute();
  mainBgSound.mute();
      for (i = 0; i <5;i++)
        killAlienSound[i].mute();
      for(i = 0;i<9;i++)
        alaserSound[i].mute();

      spaceDestruct.mute();

      mouseOverSound1.mute(); 
}
void unmuteAll(){
   menusound.unmute();
       mainBgSound.unmute();
      for (i = 0; i <5;i++)
         killAlienSound[i].unmute();
      for(i = 0;i<9;i++)
         alaserSound[i].unmute();

       spaceDestruct.unmute();

       mouseOverSound1.unmute();
}
void setAFXSoundsGain(float x){
   for (i = 0; i <5;i++)
        killAlienSound[i].setGain(x);
      for(i = 0;i<9;i++)
        alaserSound[i].setGain(x);

     spaceDestruct.setGain(x);

     mouseOverSound1.setGain(x);
      mouseOverSound1.trigger();
  }
  void setMainSoundsGain(float x){
    menusound.setGain(x);
    mainBgSound.setGain(x);
  }

  
}

