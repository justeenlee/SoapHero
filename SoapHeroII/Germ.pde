class Germ {
  float radius;
  float x;
  float y;
  PVector velocity;
  PImage germSprite;
  boolean isAlive = true;
  String germPic1 = "germ1.png";
  String germPic2 = "germ2.png";
  String germPic3 = "germ3.png";
  String germPic4 = "germ4.png";
  String germPic5 = "germ5.png";
  String germPicArray[] = {germPic1, germPic2, germPic3, germPic4, germPic5};
  
 
  Germ() {
    radius = 30;
    ellipseMode(CENTER); 
    x = random(width);
    y = random(height/2);
    ellipse(x, y, radius, radius); 
    assignSprite();
    velocity = new PVector(random(1),random(1));
  }

  void move() {
    if(isAlive)
    {
      
      x += velocity.x;
      
      y += velocity.y;
      edgeCheck();
    }
  }
  
  void display(){
    noStroke();
    fill(200);
    //ellipseMode(CENTER); 
    //ellipse(x, y, radius, radius); 
    imageMode(CENTER);
    image(germSprite,x,y,radius*1.5,radius*1.5);
  }
  
  void edgeCheck()
  {
    if(y > height/2 - radius || y < radius )
      velocity.y*=-1;
      //y -= 1;
    if(x > width - radius || x < radius)
      velocity.x*=-1;
      //x -= 1;
  }
  
  void assignSprite() {
    switch(floor(random(5))) {
      case 0:
        germSprite = loadImage(germPicArray[0]);
        break;
      case 1:
        germSprite = loadImage(germPicArray[1]);
        break;
      case 2:
        germSprite = loadImage(germPicArray[2]);
        break;      
      case 3:
        germSprite = loadImage(germPicArray[3]);
        break;      
      case 4:
        germSprite = loadImage(germPicArray[4]);
        break;
    }
  }
  
  
}
