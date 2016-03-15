class Piranha extends Fish{
Piranha(){
  
  super();
  name="Piranha";
  maxSpeed=5;
  maxWeight=50;
  maxAge=10000;
  live = true;
  weight = 5;
  age = 0; 
  skin = color(random(0,100),random(0,100),random(0,50));
  fishType = "Piranha";
  
}
  
  public void move(){
    myX+=deltaX;
    myY+=deltaY;
    int rand = int(random(200));
    if (myX >800 || myX < 0 ||rand ==3)
    {deltaX*=-1;
    }
    if (myY >600 || myY < 0||rand ==3)
    {deltaY*=-1;
    }
  
}
  
}
