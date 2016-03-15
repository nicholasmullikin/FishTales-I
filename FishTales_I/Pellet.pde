public class Pellet{
  private float deltaY;
  private float myX, myY;
  private color col; 
  private int type;
  private int size;

 Pellet(int type1){
      this.deltaY = 0.5;
      this.myX= random(0,800);
      this.myY=random(0,200);
      //this.col = color(255,255,0);
      this.size = 5;
      this.type = type1;
  }
  public float getX(){return this.myX;}
  public float getY(){return this.myY;}
  public int getType(){return this.type;}

  public void update(){
    
    move();
    show();
   
  }//update
  
  public void show(){
    if (this.type == 0)
    {
      noStroke();
      fill(0,255,255);
    }
    else if (this.type == 1)
    {
      noStroke();
      fill(0);
    }
    else if (this.type == 2)
    {
      noStroke();
      fill(0,255,0);
    }
    else if (this.type == 3)
    {
      noStroke();
      fill(100);
    }
    
      ellipse(myX,myY,size,size);
  } //show() 
  
  public void move(){
    if (myY<598)
    {
    myY+=deltaY;
    if (myY >=600 )
    {deltaY*=-1;
    }
    }
    
  }//move()
 
  //public String toString(){ return this.name+", "+(this.age )+" frames old. " + weight;}
  
}//abstract class Fish
