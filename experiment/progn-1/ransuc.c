#include<stdlib.h>
#include<limits.h>
#include<stdio.h>
double randf(void){
return (double)rand()/(RAND_MAX+1.0);
}
/*-----------------------------------*/
int main(int argc, char *argv[]){
  int i,n;
  printf("点の数:");
  scanf("%d",&n);
  srand(atoi(argv[1]));
  for(i=0; i<n; i++)
  { printf("%lf\n",randf() );}
  printf("%d\n",RAND_MAX);
}
