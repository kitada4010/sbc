#include<stdio.h>
#define N 40
#define M 3


int main(void){
  
  int i=0, l, ih, j, k, s=2, m;
  double theta[N]={0}, ripple[M+1]={0},kakudo[M]={0};
  FILE *input, *output;
  
  input =fopen("theta.txt","r");
  output =fopen("kakudo.txt","w");
  
  //  srand((unsigned) time(NULL));;
  srand((unsigned) time(NULL));;
 
  fscanf(input,"%lf",&theta[i]);
  i=-1;
  do{
    do{
      i++;
      fscanf(input,"%lf",&theta[i]);
    }while(theta[i-1]<theta[i]);
  
  ripple[0]=theta[i];
  theta[i]=0;
  
  printf("%d",i);
 
    fscanf(input,"%lf",&ripple[1]);
    ripple[2] = (ripple[0]+ripple[1])/2;
    fscanf(input,"%lf",&ripple[3]);
    if(ripple[3]>=ripple[0] &&ripple[3]<=ripple[1])
      m=3;
    else
      m=2;

    do{
    
    for(l=0; l<i; l++)
      if(theta[l]>=ripple[0])
	break;
    
    ih=l;
    
    // do{
    kakudo[0]=(ripple[0]-theta[l-1]) * (180/ (theta[l]-theta[l-1]) );
    if(ih%2==1)
      
      kakudo[0]-=180;
    
    for(j=1; j<=m; j++){
      
      for(k=l; k<i; k++){
	if(theta[k]>=ripple[j])
	  break;
      }
      
      kakudo[j]=(ripple[j]-theta[k-1]) * ( 180/(theta[k]-theta[k-1]) );
      
      if(ih%2==1)
	kakudo[j]+=(180*(k-l-1));
      else
	kakudo[j]+=(180*(k-l));
    }
    
    for(l=0; l<m; l++)
      fprintf(output,"%lf     ",kakudo[l]);
    fprintf(output,"\n");
    if(m==2){
      ripple[0]=theta[3];
      if(theta[3]!=s){
	fprintf(output,"\n\n\n");
	break;
      }
    }
    else{
      fscanf(input,"%lf",&ripple[0]);
      if(ripple[0]==s){
	fscanf(input,"%lf",&ripple[0]);
	break;
      }
      else if(ripple[0]==1){ 
	fscanf(input,"%lf",&ripple[0]); 
	fprintf(output,"\n\n\n");
	break;
      }
    }
    
    }while(1);
    i=0;
    s++;
  }while(ripple[0]!=0);
  
  fclose(input);
  fclose(output);
  
  return 0;
}
