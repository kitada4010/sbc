#include<stdio.h>
#include <stdlib.h>
#define N 40
#define M 4
int main(int argc, char *argv[]){
  
  int i, ih, j, k;
  double theta[N]={0}, ripple[M]={0},kakudo[M]={0},counth;
  
  FILE *input, *output, *outtime;
  
  input =fopen(argv[1], "r");
  output =fopen(argv[2], "w");
  outtime =fopen(argv[3], "w");

  if(argc != 4){
    printf("入力ファイル数が違います。\n");
    return 0;
  }
  
  if(input==(NULL) || output==(NULL) || outtime==(NULL)){
    printf("元のデータが見つかりませんでした。\n");
    return 0;
  }
  
  while((fscanf(input,"%lf",&counth))!=EOF){
    //if(counth==1)
      //      fprintf(output,"\n\n");
    for(i=0; i<N; i++){
      fscanf(input,"%lf",&theta[i]);
      if(i!=0 && theta[i]<theta[i-1]){
	//printf("%d\n",i);
	break;
      }
    }

    if(theta[0]==0.0) theta[0] = theta[1];
    
    ripple[0]=theta[i];
    theta[i]=0;
    
    for(j=1; j<M-1; j++)
      fscanf(input,"%lf",&ripple[j]);
    
    fprintf(output,"%lf   %lf   %lf   %lf\n", theta[0], theta[i-1], ripple[0], ripple[1]);
    fprintf(outtime,"%lf   %lf\n", theta[0], theta[i-1]);
  }
  
  return 0;
}
