//....................................................................................................................................................................................
//FIBONACCI V, 0.4

int fibo (int n)
{
  //salida de la recursión
  if(n == 1)
    return 0;
  if(n == 2)
    return 1;
  //avance de la recursión
  if(n > 2)
    return fibo(n-1) + fibo(n-2);
  //Si n es negativo o 0
  return -1;
}
//numero de cuadros que queremos pintar
int squares;
//las coordenadas x,y del punto donde se inicia el cuadro a pintar
int x;
int y;
//Se edita la funcion pre-existente setup donde se inicia el programa.
void setup()
{
  //se asignan valores al numero de cuadros y el tamaño de la ventana
  squares = 18;
  size(1200, 800);
  //se definen las coordenadas en el punto del centro de la ventana
  x = width/2;
  y = height/2;
  /*se inicia un ciclo para pintar cada uno de los cuadros requeridos,
    se inicia con el numero 2, por que fibonacci de 0 devuelbe -1 y Fibonacci
    de 1 devuelbe 0, valores que no representarian ningun cuadro y podrian ser
    contrproducentes en la logica del programa.*/
  for(int i=2; i<squares+2; i++)
  {
    //este if tiene la funcionalidad de separar el primer valor (2), de los demas en la iteración.
    if(i != 2)
    {
      if(i%4==0)
      {
  //se produce un movimiento del punto hacia abajo
        x -= fibo(i-2);
        y += fibo(i-1);
      }
      if(i%4==1)
      {
  //se produce un movimiento del punto hacia la izquierda
        x -= fibo(i);
        y -= fibo(i-2);
      }
      if(i%4==2)
      {
  //se produce un movimiento del punto hacia arriba
        y -= fibo(i);
      }
      if(i%4==3)
      {
  //se produce un movimiento del punto hacia la derecha
        x += fibo(i - 1);
      }
    }
    /*se selecciona un color que se encuentre entre 0 y 255, en sus tres campos, en la misma proporción
      en que lo esta i entre 0 y el numero de cuadros a pintar*/
    fill(map(i, squares, 0 , 0, 255)); /*otra opcion para pintar=> i*5, i*4, i*4 */
    /*se dibuja un rectangulo con alto y ancho igual al valor correspondiente de fibonacci y
      con punto de origen en los valores de x,y definidos en el momento*/
    rect(x, y, fibo(i), fibo(i));
    //escribe en consola el valor de fibonacci de cada numero que va pasando
    println("fibo("+i+")= "+fibo(i));
  }
}