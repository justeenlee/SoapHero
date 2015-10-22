 import processing.serial.*;
 Serial myPort;        // The serial port


int numberOfGerms = 30;
Germ[] germs;

int numberOfSoaps = 5;
Soap[] soapHeros;

int[][] pinTable = {{10,20,30,40,50},{11,21,31,41,51},{12,22,32,42,52}};

//Bubble[] bubbles;


void setup() {
  size(800,800);
  soapHeros = new Soap[numberOfSoaps];
  germs = new Germ[numberOfGerms];
  //bubbles = new Bubble[numberOfSoaps];
  fill(200);
  noStroke();
  //create 15 germs
  for(int i=0; i<numberOfGerms; i++) {
    germs[i] = new Germ();
  }  
  //create 5 soap heros
  for(int k=0; k<numberOfSoaps; k++) {
    soapHeros[k] = new Soap(85+140*(k), height-95);
  }
  
  myPort = new Serial(this, Serial.list()[4], 9600);
  myPort.bufferUntil('\n');
}


void draw() {
  background(0);
  updateUI();
  //delay(1000);
}


void updateUI() {
  //check whether to restart
  restart(remainingGerms());
  //check if soap is shooting
  shootingStatusCheck();

  //update bubble location
  for (Soap soapHero : soapHeros) {
    for (Bubble bubble : soapHero.bubbles) {
      if (bubble != null) {
        if (bubble.isAlive) {
          for (Germ germ : germs){
            if (germ != null) {
              //check collision
              if (bubble.doesCollide(germ)) {
                //if it's bubble then false
                //if stream of soap then still true
                //qucik fix, not good practice
                if (bubble.speed != 4){
                  bubble.isAlive = false;
                }
                germ.isAlive = false;
              }
            }
          }
          bubble.move();
          bubble.display();
        }
      }
    }
  }  
  
  //update germ location
  for(int i=0; i<numberOfGerms; i++) {
    if (germs[i] != null) {
      if (germs[i].isAlive){
        //println("It's alive");
        germs[i].move();
        germs[i].display();
        //println(germs[i].x + " " + germs[i].y);
      } else {
        germs[i] = null;
      }
    }
  }
  
  //update soap heros
  for(int i=0; i<numberOfSoaps; i++) {
    soapHeros[i].updateSoap(120+140*(i), height-45);
    //the following one was used at for rect
    //soapHeros[i].updateSoap(85+140*(i), height-95);
  }
  

} //end of updateUI()


void restart(boolean hasNoGerms) {
  if (hasNoGerms) {
    for(int i=0; i<numberOfGerms; i++) {
      germs[i] = new Germ();
    }  
  }
}
 
  
boolean remainingGerms() {
  for (Germ germ : germs) {
    if (germ != null) {
      return false;
      }
    }
  return true;
}
  


//use event based
void shootingStatusCheck(){
  if (keyPressed){
    if (key == '1') {
      if (!(soapHeros[0].amount <= 0)) {
        soapHeros[0].shoot(120);
        //add constraint to allow shooting after the first is gone
        delay(200);
      } else {
        //reload
        float time = millis();
//        while (!(millis() - time > 2000)) {
//        } this freezes the screen
          soapHeros[0].amount += 100;
          delay(200);

//        float time = millis();
//        int press = 0;
//        if (keyPressed){
//          if (key == '1'){
//            press++;
//          }
//        }
//        if (millis() - time > 1000){
//          if (press > 10){
//            soapHeros[0].amount += 100;
//          }
//        }
        
        
      }
      
      
      
      
      
    } else if (key == '2'){
      if (soapHeros[1].amount != 0) {
        soapHeros[1].shoot(260);
        delay(200);
      }
    } else if (key == '3') {
      if (soapHeros[2].amount != 0) {
        soapHeros[2].shoot(400);
        delay(200);
      }
    } else if (key == '4') {
      if (soapHeros[3].amount != 0) {
        soapHeros[3].shoot(540);
        delay(200);
      }
    } else if (key == '5') {
      if (soapHeros[4].amount != 0) {
        soapHeros[4].shoot(680);
        delay(200);
      }
    }
  }
  
}//end of shootingStatusCheck()




void serialEvent (Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  if (inString != null) {
    inString = trim(inString);
    int inInt = int(inString);
    //println(inInt);
    getAction(inInt);
  }
}


void getAction(int raw) {
  int whatAction = raw%10;
  int whichHero = raw/12;
  //println(pinTable[whatAction][whichHero]);
  if ((soapHeros[whichHero].amount > 0)) {
    if (whatAction == 0){
        soapHeros[whichHero].shoot(whichHero*140+120);
        //add constraint to allow shooting after the first is gone
        delay(200);
    }
  } else {
    while(soapHeros[whichHero].amount != 100) {
      //println(whatAction);
      if (whatAction == 1){
        soapHeros[whichHero].amount += 10;
        delay(200);
      } else if (whatAction == 2) {
        break;
      } else {
        break;
      }
    }
  }
}







//  for (Bubble bubble : bubbles) { 
//    if (bubble != null) {
//      if (bubble.isAlive) {
//        bubble.move();
//        bubble.display();
//        println("bubble should move");
//      }
//    }
//  }

  


  


