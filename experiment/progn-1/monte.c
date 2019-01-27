#include<stdio.h>
#include<stdlib.h>
#include<limits.h>
double randf(void)
{
  return (double)rand()/(RAND_MAX+1.0);
}
/*------------------------------------*/
int main(int argc, char *argv[])
{
  int i, n, cnum=0;
  double x, y, d;
  printf("点の数:");                                                                                                                                                                                        
  scanf("%d",&n);   
  srand(atoi(argv[1]));    
  for(i=0; i<n; i++){
    x=randf();
    y=randf();
    d=x*x+y*y;
    if(d<1.0){cnum++;}
  }
  printf("%.10f\n",4.0*cnum/n);
  
}
