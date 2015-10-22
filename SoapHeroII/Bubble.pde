class Bubble {
  float radius;
  float xPos;
  float yPos;
  PVector velocity;
  PImage bubbleSprite;
  boolean isAlive = true;
  float speed;
  

  Bubble(float x, float s) {
    radius = 10;
    ellipseMode(CENTER); 
    xPos = x; // go up along y axis (fixed x)
    yPos = height-95; //shoot from the the same height
    ellipse(xPos, yPos, radius, radius); 
    velocity = new PVector(random(1),random(1));
    //println("bubble created");
    speed = s;
    bubbleSprite = loadImage("bubble.png");
  }
  
  void move() {
    //check amount and change speed accordingly
    if(isAlive)
    {
      yPos -= speed;
      edgeCheck();
    }
  }
  
  void display(){
    noStroke();
    fill(200);
//    ellipseMode(CENTER); 
//    ellipse(xPos, yPos, radius, radius); 
    imageMode(CENTER);
    image(bubbleSprite,xPos,yPos,radius,radius);
  }

  void edgeCheck()
  {
    if(yPos < (0 - radius)){
      isAlive = false;
    }
  }
  
  boolean doesCollide(Germ g) {

    float distance = dist(xPos,yPos,g.x,g.y);


    //adjust 0.5 for collision precision
    if(distance < (radius+g.radius)*.7)
      return true;
    else
      return false;
  }
    
  
  





}
