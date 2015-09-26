//Números Perfectos

void setup()
{
  int n=100;
  float x=0,y=0,x0=0,y0=0;
  float g=(2*PI)/n;
  float[][] coor= new float[n][2];
  size(900, 690);
  background(113);
  strokeWeight(1);
  x0 = width/2 + cos(0) * 300;
  y0 = height/2 + sin(0) * 300;
  
  for(int i=0; i<n; i++)
  {
    x = width/2 + cos(g*(i+1)) * 300;
    y = height/2 + sin(g*(i+1)) * 300;
    coor[i][0]=(x+x0)/2;
    coor[i][1]=(y+y0)/2;    
    line(x0,y0, x,y);
    line(x,y,width/2,height/2);
    int[] divisores = divisores(i+1);
    int sum=0;
    for(int j=0; j<(i+1)/2; j++)
    {
      sum+=divisores[j];
      print(divisores[j]+" ");
    }
    println("-> "+n);
    if(sum==(i+1))
    {
      fill(0,255,0);
      for(int j=0;j<(i+1)/2;j++)
      {
        if(divisores[j]!=0)
        {
          stroke(126,255,126);
          int X=givecoorx(int(coor[divisores[j]][0]), int(coor[i][0]), 600);
          int Y=givecoory(int(coor[divisores[j]][1]), int(coor[i][1]), 600);
          bezier(coor[divisores[j]][0],coor[divisores[j]][1],X,Y,X,Y,coor[i][0],coor[i][1]);
        }
      }
    }
    else
    {
      if(sum>i+1)
      {
        fill(255,0,0);
        for(int j=0;j<(i+1)/2;j++)
        {
          if(divisores[j]!=0)
          {
            stroke(255,126,126);
            int X=givecoorx(int(coor[divisores[j]][0]), int(coor[i][0]), 600);
            int Y=givecoory(int(coor[divisores[j]][1]), int(coor[i][1]), 600);
            bezier(coor[divisores[j]][0],coor[divisores[j]][1],X,Y,X,Y,coor[i][0],coor[i][1]);
          }
        }
      }
      else
      {
        fill(0,0,255);
      }
    }
    textSize(10);
    text(i+1,coor[i][0],coor[i][1]);
    x0=x;
    y0=y; 
  }
}

int[] divisores(int n)
{
  int w=int(n/2);
  int[] divisores=new int [w];
  int k=0;
  for(int i=0; i<w; i++)
  {
    divisores[i]=0;
  }
  for(int i=1;i<n; i++)
  {
    if(n%i==0)
    {
      divisores[k]=i;
      k++;
    }
  }
  return divisores;
}

int givecoorx(int x1, int x2, int centro)
{
  int X=(x1+x2)/2;
  int distance=centro - X;
  int move=distance/2;  
  X+=move; 
  return X;
}

int givecoory(int y1, int y2, int centro)
{
  int Y=(y1+y2)/2;
  int distance=centro - Y;
  int move=distance/2;  
  Y+=move; 
  return Y;
}