int pins[5] = {7,6,5,4,3};
float storageTimes[5] ={0,0,0,0,0};
float clickHoldThreshold = 550;
boolean wasPressed[5] = {false,false,false,false,false};
boolean isHolding[5] = {false,false,false,false,false};

void setup() {
  Serial.begin(9600);
}

void loop() {
  for (int i = 0; i < 5; i++){
  getAction(i);
  }
}

void getAction(int pinIndex) {
  if (!digitalRead(pins[pinIndex])) {
    if(wasPressed[pinIndex])
    {
      //if it is already set as holding, we don't need to check if it is holding, we already know
      if(!isHolding[pinIndex]) 
      {
        long pressTime = millis() - storageTimes[pinIndex];
        if(pressTime > clickHoldThreshold){
          //then this is a hold
          isHolding[pinIndex] = true;
          //digitalWrite(13,HIGH);
          //send something to processing to saw that we are holding
          Serial.println((pinIndex+1)*10+1);
        }
      }
    }
    else {
      wasPressed[pinIndex] = true;
      storageTimes[pinIndex] = millis();
    }
  }
  else
  {
    //are we releasing?
    if(wasPressed[pinIndex])
    {
      //we are releasing
      wasPressed[pinIndex] = false;
      if (isHolding[pinIndex])
      {
        //this was a hold
        //now we are not holding anymore
        isHolding[pinIndex] = false;
        //send something to processing to say that we have stopped holding
        //Serial.println("release holding");
        Serial.println((pinIndex+1)*10+2);

      }
      else
      {
        //this was a click
        //do click stuff
        //send something to arduino that says you clicked
        //Serial.println("click");
        Serial.println((pinIndex+1)*10);
      }
    }
    else
    {
      //do nothing, we are not doing anything
    }
  }
}


