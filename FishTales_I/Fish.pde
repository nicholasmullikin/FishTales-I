class Fish{
  protected String name;
  protected float deltaX, deltaY, maxSpeed;
  protected float myX, myY;
  protected color skin, outline;
  protected int age, maxAge, maxWeight;
  protected float weight;
  protected boolean live;
  protected float oldFramecount = frameCount;
  protected String fishType;
  protected int gender;
  protected int rand = int(random(0,2));
  public int info = -1;
  protected char gender1;

  Fish(){
      this.name="nemo_"+int(random(100));
      this.maxSpeed=4;
      
      if (rand == 1)
      {
        this.gender=1;
        gender1 = 'M';
      }
      else
      {
        this.gender=-1;
        gender1 = 'F';
      }
      this.fishType = "Fish";
      this.deltaX=random(maxSpeed*-1,maxSpeed);
      this.deltaY=random(maxSpeed*-1,maxSpeed);
      this.myX=random(200,400);
      this.myY=random(200,400);
      this.skin=color(random(200),random(200),random(200));
      this.outline=color(0);
      this.weight=1;
      this.fishType = "Fish";
      this.maxWeight=200;
      this.maxAge=10000;
      this.live = true;
      this.weight = 10;
      this.age = 0;
  }
//  Fish(String name){
//      this.name=name;
//      this.maxSpeed=400;
//      this.deltaX=random(maxSpeed*-1,maxSpeed);
//      this.deltaY=random(maxSpeed*-1,maxSpeed);
//      this.myX=height/2;
//      this.myY=width/2;
//      this.skin=color(random(255),0,0);
//      this.outline=color(0);
//      this.weight=1;
//      
//      this.maxWeight=200;
//      this.maxAge=10000;
//      this.live = true;
//      this.weight = 1;
//      this.age = 0;
//  }//fish constructor
  public float getX(){return myX;}
  public float getY(){return myY;}
  public boolean getLive(){return live;}
  public float getWeight(){return weight;}
  public String getType(){return fishType;}
  public int getGender(){return gender;}
  public float getAge(){return age;}
  //public float getWidth(){return ;}

  public void update(){
    if (weight > maxWeight || age > maxAge || weight < 0.1*maxWeight || 20+age/4+fishTank.size()/12 > 150 )
    {
     live = false; 
    }
    if (this.live == true)
    {
    move();
    show();
    age++;
    weight+=(00.003);
    }
    
    else
    {
      show();
      if (myY>5)
      myY=myY-1;
    }
  }//update
  
  public void show(){
    if (fishType == "Whale")
    {
        fill(skin);
      stroke(outline);
      noStroke();
      ellipse(myX, myY, 10+weight, 10+weight);
     // ellipse(myX-weight/25*deltaX, myY-weight/5*deltaY, 10+weight, 10+weight);
      //ellipse(myX-weight/25*deltaX, myY-weight/5*deltaY, 10+weight, 10+weight);
      ellipse(myX-deltaX, myY-deltaY, 10+weight, 10+weight);
      triangle(myX-deltaX*3*weight/16, myY+deltaY*3*weight/16,  myX, myY, myX-deltaX*3*weight/16, myY-deltaY*3*weight/16);
      fill(255);
      stroke(255);

      ellipse(myX+deltaX*2*weight/16, myY+deltaY*2*weight/16, 2+weight/10, 2+weight/10);

        
      
      
    }
    else
    {
      fill(skin);
      stroke(outline);
      noStroke();
      ellipse(myX, myY, 10+weight, 10+weight);
      triangle(myX-deltaX*3*weight/16, myY+deltaY*3*weight/16,  myX, myY, myX-deltaX*3*weight/16, myY-deltaY*3*weight/16);
      fill(255);
      stroke(255);

      ellipse(myX+deltaX*2*weight/16, myY+deltaY*2*weight/16, 2+weight/10, 2+weight/10);

      
    }
    if (info==1)
    {
    text(toString(),myX-5,myY-5);
    }
  } //show() 
  
  public void changeDirection()
  {
    
   this.deltaX=random(maxSpeed*-1,maxSpeed);
   this.deltaY=random(maxSpeed*-1,maxSpeed); 
    
  }
  
  
  
  public void move(){
    myX+=deltaX;
    myY+=deltaY;
    if (myX >800 || myX < 0)
    {deltaX*=-1;
    }
    if (myY >600 || myY < 0)
    {deltaY*=-1;
    }
    
    
  }//move()
 
 public boolean hasCollision(Pellet p)
 {
  if(live==true&&sq((5+10+weight)/2) >(sq(this.myX-p.getX() )+ sq(this.myY-p.getY() ) ) ){//for pellet
   if(p.type == 0)
  { 
    weight+=5;
    //weight = sq(weight);
  }
  else if (p.type == 1)
  {
   weight-=10; 
   //weight = sqrt(weight);
  }
  else if (p.type == 2)
  {
  //this.maxSpeed=4;
  //dx = random(0,10)
  this.deltaX=random(-10,10);
  this.deltaY=random(-10,10);
  }
  else if (p.type == 3)
  {
   gender =0;
   gender1 = 'N';
  }
    return true;
  }
  return false;
   
 }/////////// end of hasCOllision
 public boolean hasCollision(Fish p)//for fish
 {
  if(live==true&&sq((p.getWeight()+10+(10+weight))/2) >(sq(this.myX-p.getX() )+ sq(this.myY-p.getY() ) ) ){
    if (fishType == "Piranha" && p.getType() == "Goldfish"&& p.getLive()==true)
    {
    this.weight+=p.getWeight()/4;
    }
    if (fishType == "Whale" && p.getType() == "Goldfish" && p.getLive()==true)
    {
    this.weight+=p.getWeight()/4;
    }
    if (p.getGender() * gender == -1 && fishType == p.getType() && p.getLive()==true && age >1000 &&p.getAge()>1000 && fishType  == "Whale")
    {
      weight -= 1;
      
      fishTank.add(new Whale());
     
    }
    
    if (p.getGender() * gender == -1 && fishType == p.getType() && p.getLive()==true && age >500 &&p.getAge()>500 && fishType  == "Piranha")
    {
      weight -= 0.5;
      
      fishTank.add(new Piranha());
     
    }
    
    if (p.getGender() * gender == -1 && fishType == p.getType() && p.getLive()==true && age >100 &&p.getAge()>100 && fishType  == "Goldfish")
    {
      weight -= 0.2;
      
      fishTank.add(new Goldfish());
     
    }
    return true;
  }
  return false;
   
 }///////end of 2nd has collision
  
  public String toString(){ return this.name+", Gender: "+(this.gender1 )+",  Weight:" + round(weight)+" Age:"+age;}
  
}//abstract class Fish
