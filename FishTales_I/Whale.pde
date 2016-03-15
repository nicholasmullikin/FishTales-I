class Whale extends Fish{
Whale(){
  
  super();
  name="Whale";
  maxSpeed=1;
  maxWeight=100;
  maxAge=30000;
  live = true;
  weight = 10;
  age = 0; 
  skin = color(random(255));
  fishType = "Whale";
  
}
  
  public void move(){
    myX+=deltaX;
    myY+=deltaY;
    int rand = int(random(300));
    if (myX >800 || myX < 0 ||rand ==3)
    {deltaX*=-1;
    }
    if (myY >600 || myY < 0||rand ==3)
    {deltaY*=-1;
    }
  
}
  
}
