#include<stdio.h>
#define N 40
#define M 4


int main(void){
  
  int i, ih, j, k;
  double theta[N]={0}, ripple[M]={0},kakudo[M]={0};
  
  printf("thetaのデータ\n");
  for(i=0; i<N; i++){
    scanf("%lf",&theta[i]);
    if(i!=0 && theta[i]==0)
      break;
   }
    
  
  printf("rippleのデータ\n");
  for(i=0; i<M-1; i++)
    scanf("%lf",&ripple[i]);
  
  ripple[3]=ripple[2];
  ripple[2]=(ripple[1]-ripple[0])/2+ripple[0];
  
  
  for(i=0; i<N; i++)
    if(theta[i]>=ripple[0])
      break;
  ih=i;
  
  kakudo[0]=(ripple[0]-theta[i-1]) * (180/ (theta[i]-theta[i-1]) );
  if(ih%2==1)
    kakudo[0]-=180;
  
  for(j=1; j<=3; j++){
    
    for(k=i; k<N; k++)
      if(theta[k]>=ripple[j])
	break;
    
    kakudo[j]=(ripple[j]-theta[k-1]) * (180/ (theta[k]-theta[k-1]) );
    
    if(ih%2==1)
      kakudo[j]+=(180*(k-i-1));
    else
      kakudo[j]+=(180*(k-i));
  
  }
  
  
  // printf("%lf     ",ripple[2]);
  for(i=0; i<M; i++)
    printf("%lf     ",kakudo[i]);
  printf("\n");
  
  return 0;
}
