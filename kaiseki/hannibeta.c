#include<stdio.h>
//#include<stdlibe.h>
#define MAX 800
#define MIN 180
int main (void){
  int kakudo[MAX]={0}, i;
  double start, end, maxend=0, minstart=0;
  
  printf("rppleの初めと終わり");
  scanf(" %lf, %lf",&start,&end);
  if(maxend<end)
    maxend=end;
  if(minstart>start)
    minstart=start;
  for(i=start; i<end; i++){
    kakudo[i+MIN]++;
  }
  
  for(i=minstart+MIN; i<maxend+MIN+1; i++)
    printf("%d, %d\n",i-MIN,kakudo[i]);
  
  return 0;
}

