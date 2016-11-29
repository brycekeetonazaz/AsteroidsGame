class Bullet extends Floater
{
	public Bullet(SpaceShip theShip)
	{
		myCenterX = theShip.getX();
		myCenterY = theShip.getY();
		myPointDirection = theShip.getPointDirection();
		double dradians =myPointDirection*(Math.PI/180);
		myDirectionX = 5*Math.cos(dradians) + theShip.myDirectionX;
		myDirectionY = 5*Math.sin(dradians) + theShip.myDirectionY;
		
	}
	
	public void show()
	{
		fill(255,0,0);
		noStroke();
		ellipse((float)myCenterX, (float)myCenterY, 5, 5);
	}
	public void move ()   //move the floater in the curent direction of travel
  	{           
    	myCenterX += myDirectionX;    
    	myCenterY += myDirectionY;    
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