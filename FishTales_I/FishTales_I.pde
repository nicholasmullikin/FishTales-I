/*
  FishTales
  Nicholas Mullikin
  1/20/15
  Notes: All buttons work
  Extra functions:
    -Bubbles
    -Tail, usually visible when fish grow larger
    -Crazy Pellets
    -Neuter Pellets
    -Fish tank gets cloudier and fish die; reset button
    -Clicking on fish displays information
    -Gender attribute; reproduce after certain age unless neutered
    -Hide / Show Panel
    
*/
int bC=100;
float[] circleX = new float [bC];
float[] circleY = new float [bC];

ArrayList<Fish> fishTank = new ArrayList<Fish>();
ArrayList<Pellet> pelletTank = new ArrayList<Pellet>();

float r =150;
int stage = 0;
boolean taptheTank = false;
float oldFramecount=0;
void setup(){
  ellipseMode(CENTER);
  frame.setResizable(true);
  //frame.setSize(820,620);
  size(800,600);
 
 for (int i=0; i<bC; i++) {
    circleX[i]=random(800);
    circleY[i]=random(600, 1200);
  }
}

void draw(){
  noStroke();
  //background(100,100,random(200));
  background(0,20+fishTank.size()/12,255-fishTank.size());
 for (int i = 0; i <fishTank.size(); i++)///////pellot collision
 {
   
  Fish f = fishTank.get(i);
  fishTank.get(i).update(); 
  for (int g = 0; g < pelletTank.size(); g++)
  {
   
   Pellet p = pelletTank.get(g);
   if (f.hasCollision(p))
   {
     
     pelletTank.remove(g);
     
   }
  }
 }
 
 
 
 
 
 
 for (int ie = 0; ie <fishTank.size(); ie++)///////pellot collision
 {
   
  Fish f1 = fishTank.get(ie);
  for (int j = ie+1; j < fishTank.size(); j++)
  {
   
   Fish f2 = fishTank.get(j);
   if (f1.hasCollision(f2)&&f1.fishType == "Piranha"&&f2.fishType=="Goldfish")
   {
     f1.changeDirection();
     fishTank.remove(j);
     
   }
   else if (f1.hasCollision(f2) && f1.fishType == "Whale" && f2.fishType=="Goldfish" && f1.live==true && f2.live==true)
   {
     
     fishTank.remove(j);
     f1.changeDirection();
     
   }
  }
 }
 
 
 
 
 
 
for (int j = 0; j <pelletTank.size(); j++)
{
  pelletTank.get(j).update(); 
}
 
 if(stage == 0)
 {
 stroke(0,50);
 fill(10,50);
 rect(600,00,800,800);
 for (int i = 0; i <=400; i+=100)
 {
   rect(625,100+i,50,50);
   rect(725,100+i,50,50);
 }
 fill(200);
 text("Piranha",625,125);
 text("Whale",725,125);
 text("Goldfish",625,225);
 text("Reset",725,225);
 text("Food",625,325);
 text("Poison",725,325);
 text("Neuter",625,425);
 text("Special",725,425);
 text("Hide Panel",625,525);
 text("Tap the Tank",725,525);
  
 }
 else if (stage == 1)
 {
 fill(0,75);
 //stroke(0,50);
 ellipse(width,30+height/2,45,45);
 
   
 } 

if (taptheTank)
{
taptheTank();
  
 if (frameCount-oldFramecount > 5)
 {
   taptheTank = false;
}
 println(stage);
}


for (int i=0; i<bC; i++) {
  fill(75,255);
  noStroke();
    circleY[i] -= 1;
    ellipse(circleX[i], circleY[i], 3, 3);

if (circleY[i]<0) {
      circleY[i]=random(600,1200);
    }
}
}//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////end of void draw

void mouseClicked()
{
for (int i = 0; i < fishTank.size(); i++)
{
  Fish f = fishTank.get(i);
  if ((sq(f.myX-mouseX) + sq(f.myY-mouseY)) < sq((10+f.weight)*4))
  {
    f.info *=-1;
  }
  
}
  
  
  
  
  
if(square(650,125,25,mouseX,mouseY))//first button
{
  fishTank.add(new Piranha());
}
if(square(750,125,25,mouseX,mouseY))//second
{
  fishTank.add(new Whale());
}
if(square(650,225,25,mouseX,mouseY))//third
 {
   fishTank.add(new Goldfish());
  
 }
if(square(750,225,25,mouseX,mouseY))//fourth
 { for(int b = 0; b < 15; b++)
   {
    for (int z = 0; z < pelletTank.size(); z ++)
      {
        pelletTank.remove(z);

       }
     for (int a = 0; a < fishTank.size(); a ++)
     {
        fishTank.remove(a);
     }
   }
 }
 
if(square(650,325,25,mouseX,mouseY))//fith
{
  
  for (int x = 0; x < 9; x ++)
   {
    pelletTank.add(new Pellet(0));
   }
  
}

if(square(750,325,25,mouseX,mouseY))//six
{
  
  for (int y = 0; y < 9; y ++)
  {
  pelletTank.add(new Pellet(1));
  }
  
}

if (stage == 1 && (sq(300-mouseX) + sq(600-mouseY)) > sq(5));//circle
{
  stage = 0;
  frame.setSize(820,620);
}
if(square(650,425,25,mouseX,mouseY))//seven
{
  
   for (int y = 0; y < 9; y ++)
  {
  pelletTank.add(new Pellet(3));
  }
  
  }
if(square(750,425,25,mouseX,mouseY))//eight
{
  
  for (int y = 0; y < 9; y ++)
  {
  pelletTank.add(new Pellet(2));
  }
  
}
if(square(650,525,25,mouseX,mouseY))//nine
{
  
 stage = 1;
  frame.setSize(620,620);
  
}
 
 if(square(750,525,25,mouseX,mouseY))//ten
{
  taptheTank=true;
  oldFramecount = frameCount;
   
}
}//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// end of mouseClicked

boolean square(int x, int y, int rad,int myx,int myy)
{
  
 if (x+rad>myx && x-rad<myx && y+rad>myy && y-rad<myy)
 {
  return true; 
 }
return false; 
}
void taptheTank()
{
 
 for (int i = 0; i <fishTank.size(); i++)///////pellot collision
 {
   Fish f = fishTank.get(i);
   f.myY = f.myY + random(-20,20);
   f.changeDirection();
 }
 for (int i = 0; i <pelletTank.size(); i++)
  {
   Pellet d = pelletTank.get(i);
   d.myY = d.myY + random(-20,20);
  } 
 }
  
  

