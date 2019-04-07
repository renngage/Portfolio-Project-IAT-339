  Tri[] arrayT = new Tri[10];


void setup()
{
  size(2560,100);

  for(int i = 0; i < 10; i++)
  {
    arrayT[i] = new Tri(new PVector(random(100),random(100)), new PVector(random(5),random(8)), new PVector(random(5),random(4)));
  }
  smooth();

}

//Tri t = new Tri(new PVector(100,100), new PVector(1,3.3), new PVector(0.3,0));

void draw()
{
    background(255);

for(int i = 0; i < arrayT.length; i++)
{
 arrayT[i].drawChar();
 arrayT[i].move();
}

}

class Tri
{
  PVector pos, vel, accel;


  Tri(PVector pos, PVector vel, PVector accel)
  {
    this.pos = pos;
    this.vel = vel;
    this.accel= accel;

  }

  void drawChar()
  {
    ellipse(pos.x,pos.y,8,8);
    fill(#FF4500);

  }

  void move()
  {
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,pos);

    dir.normalize();
    dir.mult(0.5);

    accel = dir;

   vel.add(accel);
   vel.limit(10);
   pos.add(vel);

   checkWalls();

  }

  void checkWalls()
  {
    if((pos.x > width) || (pos.x < 0))
    {
      vel.x = vel.x *-1;
    }

    if((pos.y > height) || (pos.y < 0))
    {
      vel.y = vel.y *-1;
    }

  }



}