NormalParticle [] stars;//your code here
void setup()
{
  size(800, 800);
  stars = new NormalParticle[40];
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
    speed = Math.random()*20;
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
	//your code here
}
class OddballParticle implements Particle//uses an interface
{
	void move(){
}
void show(){
}
//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}
