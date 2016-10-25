//your variable declarations here
SpaceShip space = new SpaceShip();
Star[] lotsaStars = new Star[50];
public void setup() 
{
  //your code here
  size(800,600);
  space.setX(400);
  space.setY(300);

  for(int i = 0; i < lotsaStars.length; i++)
  {
  	lotsaStars[i] = new Star((int)(Math.random()*width), (int)(Math.random()*height));
  }
}
public void draw() 
{
  //your code here
  background(0);
  space.show();
  space.move();

  for(int i = 0; i < lotsaStars.length; i ++)
  {
  	lotsaStars[i].show();
  }
}
public void keyPressed()
{
	if(keyCode == UP)
  {
  	space.accelerate(0.1);
  	stroke(255,0,0);
  	strokeWeight(5);
  	noFill();
  	arc(space.getX(), space.getY(), 100, 100, (float)((space.getPointDirection()+90)*(Math.PI/180)), (float)((space.getPointDirection()+270)*(Math.PI/180)));
  	strokeWeight(2);
  }
  if(keyCode == LEFT)
  {
  	space.rotate(10);
  }
  else if(keyCode == RIGHT)
  {
  	space.rotate(-10);
  }
  if(keyCode == DOWN)
  {
  	space.setX((int)(Math.random()*width));
  	space.setY((int)(Math.random()*height));
  	space.setDirectionX(0);
  	space.setDirectionY(0);
  }
}
class Star
{
	int myX, myY, myColor;
	public Star(int x, int y)
	{
		myX = x;
		myY = y;
		myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
	}
	public void show()
	{
		noStroke();
		fill(myColor);
		ellipse(myX, myY, 10, 10);
	}
	public void changeColor()
	{
		int r, b, g;
		
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
  protected double myPointDirection; //holds current direction the ship is pointing in degrees 

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
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
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
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

