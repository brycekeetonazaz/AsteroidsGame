//your variable declarations here
SpaceShip space = new SpaceShip();
ArrayList <Asteroid> roids;
ArrayList <Bullet> maga = new ArrayList <Bullet>();
boolean alive = true;
Star[] lotsaStars = new Star[50];
double difficulty = 180;
double scale = 1;
int score = 0;
int numBuls = 0;
public void setup() 
{
  //your code here
  size(800,600);
  space.setX(400);
  space.setY(300);
  roids = new ArrayList <Asteroid>();
  for(int i = 0; i < lotsaStars.length; i++)
  {
  	lotsaStars[i] = new Star((int)(Math.random()*width), (int)(Math.random()*height));
  }
  
}
public void draw() 
{
  //your code here
  if(alive == true)
  {
	  background(0);
	  if(counter(difficulty)==true)
	  {
	  	roids.add(new Asteroid());
	  	roids.get(roids.size()-1).setX(10);
	    roids.get(roids.size()-1).setY(10);
	    roids.get(roids.size()-1).setDirectionX(((Math.random()*4)-2));
	    roids.get(roids.size()-1).setDirectionY(((Math.random()*4)-2));
	    if(difficulty > 0)
	    	difficulty--;
	  }
	  for(int i = 0; i < lotsaStars.length; i ++)
	  {
	  	lotsaStars[i].show();
	  	lotsaStars[i].changeColor();
	  }
	  for(int i = 0; i < roids.size(); i ++)
	  {
	  	roids.get(i).move();
	  	roids.get(i).show();
	  }
	  
	  if(keyPressed == true && keyCode == SHIFT && numBuls == 0)
	  {
	  		maga.add(new Bullet(space));
	  		numBuls ++;
	  		space.myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	  }
	  else
	  {
	  		numBuls = 0;
	  }
	  space.collision();
	  for(int i = 0; i < maga.size(); i++)
	  {
	  	maga.get(i).show();
	  	maga.get(i).move();
	  	/*
	  	if(maga.get(i).getX() >width)
	    {     
	      maga.remove(i);    
	    }    
	    else if (maga.get(i).getX()<0)
	    {     
	      maga.remove(i);    
	    }    
	    if(maga.get(i).getY() >height)
	    {    
	      maga.remove(i);   
	    }   
	    else if (maga.get(i).getY() < 0)
	    {     
	      maga.remove(i);    
	    }*/  
	  }

  
	  space.show();
	  space.move();
	  if(keyPressed == true && keyCode == UP)
	  {
	  	space.accelerate(0.1);
	  	space.myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	  	stroke(255,0,0);
	  	strokeWeight(5);
	  	noFill();
	  	arc(space.getX(), space.getY(), 100, 100, (float)((space.getPointDirection()+90)*(Math.PI/180)), (float)((space.getPointDirection()+270)*(Math.PI/180)));
	  	strokeWeight(2);
	  }
	  if(keyPressed == true && keyCode == RIGHT)
	  {
	  	space.rotate(5);
	  	//space.myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	  }
	  else if(keyPressed == true && keyCode == LEFT)
	  {
	  	space.rotate(-5);
	  	//space.myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	  }
	  if(keyPressed == true && keyCode == DOWN)
	  {
	  	space.setX((int)(Math.random()*width));
	  	space.setY((int)(Math.random()*height));
	  	space.setDirectionX(0);
	  	space.setDirectionY(0);
	  	space.myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	  }
	  textSize(20);
	  fill(255);
	  textAlign(LEFT);
	  text("Your score: "+ score, 20,20);
	}
	else{
		background((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		textSize(100);
		textAlign(CENTER);
		text("You Died", width/2, height/2);
		textSize(50);
		text("Press S to Restart", width/2, height/2 + 50);
		text("Your Score: "+score, width/2, height/2 + 100);
		if(keyPressed == true && key == 's')
		{
			background(0);
			space.setY(height/2);
			space.setX(width/2);
			space.setDirectionX(0);
			space.setDirectionY(0);
			score = 0;
			setup();
			alive = true;
			frameCount = 0;
		}
	}
}

public boolean counter(double tLength)
{
	if(frameCount % tLength == 0)
		return true;
	else
		return false;
}

class Star
{
	int myX, myY, r, g, b;
	public Star(int x, int y)
	{
		myX = x;
		myY = y;
		r=(int)(Math.random()*255);
		g=(int)(Math.random()*255);
		b=(int)(Math.random()*255);
	}
	public void show()
	{
		noStroke();
		fill(r, g, b);
		ellipse(myX, myY, 10, 10);
	}
	public void changeColor()
	{
		constrain(r, 55, 200);
		constrain(g, 55, 200);
		constrain(b, 55, 200);
		r+=(int)(Math.random()*50)-25;
		g+=(int)(Math.random()*50)-25;
		b+=(int)(Math.random()*50)-25;
		if(r < 100){r+=5;}
		if(g < 100){g+=5;}
		if(b < 100){b+=5;}

		if(r > 200){r-=5;}
		if(g > 200){g-=5;}
		if(b > 200){b-=5;}
	}
}
class SpaceShip extends Floater  
{   
    //your code here
  public SpaceShip()
  {
   	corners = 7;
   	int[] xC = {-9, -13, -9, -9, -13, -9, 10, -9};
   	int[] yC = {-5,  -3, -1,  1,   3,  5,  0,  5};
   	myColor = 255;

   	for(int i = 0; i < xC.length; i ++)
   	{
   		xC[i]*=2;
   		yC[i]*=2;
   	}

   	xCorners = xC;
   	yCorners = yC; 
  }

  public void collision()
  {
  	for(int i = 0; i < roids.size(); i++)
  	{
		if((dist((float)myCenterX, (float)myCenterY, (float)roids.get(i).getX(), (float)roids.get(i).getY())) <= 50)
  		{
  			alive = false;
  		}

  		for(int a = 0; a < maga.size(); a ++)
  		{
  			if((dist((float)maga.get(a).getX(), (float)maga.get(a).getY(), (float)roids.get(i).getX(), (float)roids.get(i).getY())) <= 30)
  			{
  				roids.remove(i);
  				maga.remove(a);
  				score ++;
  				break;
  			}
  		}
  		
  	}
  }

  public void setX(int x) {myCenterX = x;}  
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}   
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}   
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}   
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  public double getPointDirection() {return myPointDirection;} 

}



class Asteroid extends Floater
{
	private int rotSpd = (int)(Math.random()*10)-5;

	public Asteroid()
	{
		corners = 8;
		int[] xC = {1,   11, 16, 14,  2, -17, -17, -4};
		int[] yC = {-15, -8, -1, 12, 15,   8,  -1,-10};
		myColor = color(102, 51, 0);

		for(int i = 0; i < xC.length; i ++)
		{
			xC[i]*=2;
			yC[i]*=2;
		}

		xCorners = xC;
		yCorners = yC;
	}

	public void setX(int x) {myCenterX = x;}  
  	public int getX() {return (int)myCenterX;}
  	public void setY(int y) {myCenterY = y;}   
  	public int getY() {return (int)myCenterY;}
  	public void setDirectionX(double x) {myDirectionX = x;}   
  	public double getDirectionX() {return myDirectionX;}
  	public void setDirectionY(double y) {myDirectionY = y;}   
  	public double getDirectionY() {return myDirectionY;}
  	public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  	public double getPointDirection() {return myPointDirection;} 
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds curent direction the ship is pointing in degrees 

  abstract public void setX(int x); 
  abstract public int getX();

  abstract public void setY(int y); 
  abstract public int getY();

  abstract public void setDirectionX(double x);  
  abstract public double getDirectionX();

  abstract public void setDirectionY(double y);  
  abstract public double getDirectionY();

  abstract public void setPointDirection(int degrees);  
  abstract public double getPointDirection();

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the curent direction the floater is pointing to radians    
    double dradians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dradians));    
    myDirectionY += ((dAmount) * Math.sin(dradians));       
  }   
  public void rotate (int nDegreesOfrotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfrotation;   
  }   
  public void move ()   //move the floater in the curent direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the curent position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dradians = myPointDirection*(Math.PI/180);                 
    int xrotatedTranslated, yrotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using curent direction 
      xrotatedTranslated = (int)((xCorners[nI]* Math.cos(dradians)) - (yCorners[nI] * Math.sin(dradians))+myCenterX);     
      yrotatedTranslated = (int)((xCorners[nI]* Math.sin(dradians)) + (yCorners[nI] * Math.cos(dradians))+myCenterY);      
      vertex(xrotatedTranslated,yrotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

