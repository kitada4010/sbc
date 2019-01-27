#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[])
{
  int i, a[10],n=10;
  srand(atoi(argv[1]));  //ジードの設定
  for(i=0; i<n; i++){ a[i] = rand();}
  
  for(i=0; i<n; i++)
    printf("%d ",a[i]);
  
}
