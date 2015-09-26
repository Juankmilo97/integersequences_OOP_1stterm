boolean primos (int n)
{
  for(int i=2; i<n; i++)
    if(n % i==0)
      return false;
  return true;
}

void setup()
{
 size(1400, 400);
 for(int i=1; i<=width; i++)
 {
   if(primos(i)==true)
   {
     stroke(map(i,width,0,0,255),0,map(i,width,0,255,0));
     rect(i, 0, 0, height);
   }
   println(primos(i));
 }
}