JumboParticle gg;
Particle[] a = new Particle[100];
void setup()
{
	size(800,800);
	for(int i = 0; i<100; i++)
	{
		if(i<1)
		{
			a[i]= new OddballParticle();
		}
		else
		{
			a[i] = new NormalParticle();
		}	
	}
	gg=new JumboParticle();
}
void draw()
{
	background(0);
	for(int i = 0; i<100; i++)
	{
	a[i].show();
	a[i].move();
}
gg.show();
	gg.move();
}
class NormalParticle implements Particle
{
	int partcolor;
	double x, y, dSpeed, dAngle;
	NormalParticle()
	{
		x = 400;
		y = 400;
		dSpeed = Math.random()*10;
		dAngle = Math.PI*Math.random()*5;
		partcolor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
	}
	public void move()
	{
		x = x + Math.cos(dAngle)*dSpeed;
		y = y + Math.sin(dAngle)*dSpeed;
		if(x>=800 || y>=800 || y <= 0 || x <= 0)
		{
			x = 400;
			y = 400;
		}
	}
	public void show()
	{
		fill(partcolor);
		ellipse((float)x,(float)y,10,10);
	}
}

class OddballParticle implements Particle
{
	double x,y,dAngle,dSpeed;
	int partcolor,g;
	OddballParticle()
	{
		x = 400;
		y = 400;
		dAngle = Math.PI*Math.random()*5;
		dSpeed = Math.random()*10;
		partcolor = color(255);
		g=40;
	}
	public void move()
	{
		if(x>=800 || y>=800 || y<=0 || x<=0)
		{
			dAngle = Math.PI * Math.random();
			x = 400;
			y = 400;

		}
		x = x + Math.cos(dAngle)*dSpeed;
		y = y + Math.sin(dAngle)*dSpeed;
	}
	public void show()
	{
		fill(partcolor);
		ellipse((float)x, (float)y, g, g);
	}
}
class JumboParticle extends OddballParticle
{
 JumboParticle()
 {g=100;}

}
interface Particle
{
	public void move();
	public void show();
}
