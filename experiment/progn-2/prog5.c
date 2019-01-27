#include<stdio.h>
#include<stdlib.h>
int main(int argc, char *argv[])
{
  int *array, i, length;
  scanf("%d",length);  //長さの入力
  array = (int *)calloc(length, sizeof(int));
  for(i=0; i<length; i++){
    array[i] = i;
    printf("array[%d] = %d\n",i,array[i]);
  }
  free(array);
  return 0;
}
