class Goldfish extends Fish{
  Goldfish(){
  super();
  name="Goldfish";
  maxSpeed=3;
  maxWeight=30;
  maxAge=20000;
  live = true;
  weight = 3;
  age = 0; 
  skin = color(random(100,255),random(100,200),50);
  fishType = "Goldfish";
  
}
public void move(){
    myX+=deltaX;
    myY+=deltaY;
    int rand = int(random(100));
    if (myX >800 || myX < 0 ||rand ==3)
    {deltaX*=-1;
    }
    if (myY >600 || myY < 0||rand ==3)
    {deltaY*=-1;
    }
  
}
}
