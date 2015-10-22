class Soap {
  float radius;
  float xPos;
  float yPos;
  PImage soapSprite;
  float soapWidth;
  float soapHeight;
  int capacity;
  int amount;
  int power;
  Bubble bubbles[];
  
  
  Soap(float xPos, float yPos) {
    soapWidth = 70;
    soapHeight = 90;
    capacity = 100;
    amount = 100;
    rect(xPos, yPos, soapWidth, soapHeight);
    bubbles = new Bubble[5];
    //soapSprite = loadImage("bottle10.png");
  }


  void shoot(float fromX){
    if (amount > 40) {
     //shoot stream
     float bubbleSpeed = 4;
     amount -= 10;
    bubbles[0] = new Bubble(fromX, bubbleSpeed);
    }
    else if (amount > 0 && amount <= 40 ) {
     //shooot bubble
     float bubbleSpeed = 1.5;
     amount -= 10;
    bubbles[0] = new Bubble(fromX, bubbleSpeed);
    } 
    //println("amount left: " + amount);
  }
  
  
  void reload(){
    //refill animation
    amount = capacity;
  }


  void assignSoapSprite(int amount){

    switch(amount){
      case 0:
        soapSprite = loadImage("bottle0.png");
        break;
      case 10:
        soapSprite = loadImage("bottle1.png");
        break;
      case 20:
        soapSprite = loadImage("bottle2.png");
        break;
      case 30:
        soapSprite = loadImage("bottle3.png");
        break;
      case 40:
        soapSprite = loadImage("bottle4.png");
        break;
      case 50:
        soapSprite = loadImage("bottle5.png");
        break;
      case 60:
        soapSprite = loadImage("bottle6.png");
        break;
      case 70:
        soapSprite = loadImage("bottle7.png");
        break;
      case 80:
        soapSprite = loadImage("bottle8.png");
        break;
      case 90:
        soapSprite = loadImage("bottle9.png");
        break;
      case 100:
        soapSprite = loadImage("bottle10.png");
        break;
    }


  }
  void updateSoap(float xPos, float yPos) {
    assignSoapSprite(amount);
    soapWidth = 70;
    soapHeight = 90;
    //rect(xPos, yPos, soapWidth, soapHeight);
    image(soapSprite,xPos,yPos,soapWidth,soapHeight);
  }




}
