PImage img1;
PImage img2;
Particle [] stars;//your code here
void setup()
{
  size(800, 800);
  img1 = loadImage("thing1.png");
  img2 = loadImage("thing2.png");
  stars = new Particle[40];
  for (int i = 0; i < stars.length ; i++){
    stars[i] = new NormalParticle();
  }
  //your code here
}
void draw()
{
  background(0);
  for (int i = 0; i < stars.length ; i++){ 
    stars[i].move();	
    stars[i].show();
  }
  //your code here
}
class NormalParticle implements Particle
{
	double posX, posY, speed, angle;
  int col;
  NormalParticle(){
    posX = 400;
    posY = 400;
    speed = (Math.random()*10+1);
    angle = (Math.random()*2*PI);
    col = (int)(Math.random()*100)+100;
  }
  public void move(){
    posX += Math.cos(angle)*speed;
    posY += Math.sin(angle)*speed;
  }
  public void show(){
    fill(col, col, col);
    ellipse((float)posX, (float)posY, 10, 10);
  }
  
}
interface Particle
{
	public void move();
  public void show();
  //your code here
}
class OddballParticle implements Particle//asteroids?
{
  double posX, posY, speed, angle;
  int col, size;
  OddballParticle(){
    posX = 400;
    posY = 400;
    speed = (Math.random()*5+1);
    angle = (Math.random()*2*PI);
    col = (int)(Math.random()*100)+100;
    size = (int)(Math.random()*10)+5;
  }
	void move(){
  posX += Math.cos(angle)*speed;
  posY += Math.sin(angle)*speed;
  
}
  void show(){
  noStroke();
  image(img1, posX, posY, 74.7, 77.4);
  

}
class JumboParticle //uses inheritance
{
	//your code here
}
