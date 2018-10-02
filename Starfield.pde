PImage img1; //asteroid

Particle [] stars;//your code here
void setup()
{
  size(800, 800);
  img1 = loadImage("thing1.png");
  stars = new Particle[400];
  for (int i = 0; i < stars.length ; i++){
    if (i%71==0){
      stars[i] = new OddballParticle();
    }else if (i%51 == 0){
      stars[i] = new JumboParticle(Math.random());
    } else if (i==300){
      stars[i] = new Tardis();
    }else{
    stars[i] = new NormalParticle();
    }
  }
}
void draw()
{
  background(0);
  for (int i = 0; i < stars.length ; i++){ 
    stars[i].move();	
    stars[i].show();
  }
}
class NormalParticle implements Particle
{
	double posX, posY, speed, angle, size;
  int col;
  float alpha;
  NormalParticle(){
    posX = 400;
    posY = 400;
    speed = (Math.random()*50+1);
    angle = (Math.random()*2*PI);
    col = 200+(int)(Math.random()*56);
    size = (Math.random()*5)+5;
    alpha = 20;
  }
  public void move(){
    posX += Math.cos(angle)*speed;
    posY += Math.sin(angle)*speed;
    alpha += abs((float)(Math.sin(angle)*speed)*1.5);
    if (posX >= 900|| posX <= -100 || posY >= 900 || posY<= -100){
      posX = 400;
      posY = 400;
      angle = (Math.random()*2*PI);
      speed = (Math.random()*20+1);
      alpha = 20;
    }
  }
  public void show(){
    fill(col, col, col, alpha);
    ellipse((float)posX, (float)posY, (float)size, (float)size);
  }
  
}
interface Particle
{
	public void move();
  public void show();
}
class OddballParticle implements Particle//asteroids
{
  double posX, posY, speed, angle, size;
  int col;
  OddballParticle(){
    posX = 400;
    posY = 400;
    speed = (Math.random()*20+1);
    angle = (Math.random()*2*PI);
    col = (int)(Math.random()*100)+100;
    size = 0.1;
  }
	void move(){
    posX += Math.cos(angle)*speed;
    posY += Math.sin(angle)*speed;
    if ( posX >= 900 || posX <= -100 || posY >= 900 || posY <= -100){
      posX = 400;
      posY = 400;
      size = 0.1;
      angle = (Math.random()*2*PI);
      speed = (Math.random()*20+1);
    }
  }
  void show(){
    noStroke();
    image(img1, (float)posX, (float)posY, (float)(74.7*size), (float)(77.4*size));
    size += ((Math.cos(angle)*speed)*0.005);
  }
}
class JumboParticle extends NormalParticle//planets
{
  double speed = (Math.random()*10+1);
  PImage img;
  float size;
  JumboParticle(double maybe){  
    if (maybe<0.5){
      img = loadImage("thing2.png");
    }else{
      img = loadImage("thing3.png");
    }
  }
  public void move(){
    posX += Math.cos(angle)*speed;
    posY += Math.sin(angle)*speed;
    if (posX >= 900|| posX <= -100 || posY >= 900 || posY<= -100){
      posX = 400;
      posY = 400;
      size = 0.1;
    }
  }
  public void show(){
    noStroke();
    double maybe = Math.random();
    image(img, (float)posX, (float)posY, 74.7*size, 77.4*size);
    size += ((Math.cos(angle)*speed)*0.005);
  }
}
  class Tardis extends NormalParticle//planets
{
  double speed = 5;
  PImage img;
  float size;
  Tardis(){  
    img = loadImage("tardis.gif");
  }
  public void move(){
    posX += Math.cos(angle)*speed;
    posY += Math.sin(angle)*speed;
    rotate(1/(2*PI));
    if (posX >= 900|| posX <= -100 || posY >= 900 || posY<= -100){
      posX = 400;
      posY = 400;
      size = 0.1;
    }
  }
  public void show(){
    noStroke();
    image(img, (float)posX, (float)posY, 50*size, 49.6*size);
    size += ((Math.cos(angle)*speed)*0.005);
  }
}
