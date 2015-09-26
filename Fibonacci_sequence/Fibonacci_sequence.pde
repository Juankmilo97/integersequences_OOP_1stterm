//....................................................................................................................................................................................
//FIBONACCI V. 0.1

/*
Esta función retorna el enésimo término de la serie de Fibonacci
*/
int fibo (int n)
{
  //salida de la recursion
  if(n == 1)
    return 0;
  if(n == 2)
    return 1;
  //avance de la recursion
  if(n > 2)  
    return fibo(n-1) + fibo(n-2);
  //Si n es negativo o 0
  return -1;
}

int squares;
//int x = width/2;
//int y = height/2;

void setup()
{
  squares = fibo(7);
  size(1300, 60);
  int w = width/squares;  
  for(int i=0; i<squares; i++)
  {
    fill(map(fibo(i+1), fibo(squares), 0 , 0, 255));
    rect(i*w, 0, w, 50);
  }
}

//HOLA PROBANDO EL GIT CON BRANCHING 3...2...1...PROBANDO!!!