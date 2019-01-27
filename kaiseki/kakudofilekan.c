#include<stdio.h>
#include<time.h>
#define N 40
#define M 3

static double oboe


void  dousyutu(double theta[N],double ripple[M] ,double kakudo[M]){
  
  int i, ih, j, k;
  //  double theta[N]={0}, ripple[M]={0},kakudo[M]={0};
  
  /*
  printf("thetaのデータ\n");
  for(i=0; i<N; i++){
    scanf("%lf",&theta[i]);
    if(i!=0 && theta[i]==0)
      break;
  }


  printf("rippleのデータ\n");
  for(i=0; i<M; i++)
    scanf("%lf",&ripple[i]);
    
  */
  
  for(i=0; i<N; i++)
    if(theta[i]>=ripple[0])
      break;
  ih=i;
  
  kakudo[0]=(ripple[0]-theta[i-1]) * (180/ (theta[i]-theta[i-1]) );
  if(ih%2==1)
    kakudo[0]-=180;
  
  for(j=1; j<=2; j++){
    
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
  /*
  for(i=0; i<M; i++)
    printf("%lf     ",kakudo[i]);
  printf("\n");

  */
}
  


void detaripple(double a, double ripple[M], FILE *input){
  
  int i;
    
  ripple[0]=a;
  
  for(i=1; i<M; i++)
    fscanf(input,"%lf",&ripple[i]);
  
  if(ripple[0] > ripple[2] || ripple[2] > ripple[1]){
    oboe=ripple[2];
    ripple[2]=0;
  }
      
}



int deta(double theta[N], double ripple[M], FILE *input, double h){
  
  int j=-1;
   
  if(h!=1){
    theta[0]=h;
    j++;
  }
  
  do{
    j++;
    fscanf(input,"%lf",&theta[j]);
  }while(theta[j]>theta[j-1] || j==0);
  
  detaripple(theta[j],ripple,input);
  theta[j]=0;
  
  return j;
}




void filesyuturyoku(double kakudo[M], FILE *output){
  
  int i;
  
  for(i=0; i<M; i++)
    fprintf(output,"%lf       ",kakudo[i]);
  
  fprintf(output,"\n");
  
}


/*------------------------------------------------------------------------*/
int main(void){
  
  int j,k;
  double theta[N]={0}, ripple[M]={0}, kakudo[M]={0}, count=1.0, hozon, i=1;
  
  FILE *input, *output;

  input =fopen("theta.txt","r");
  output =fopen("kakudo.txt","w");
  
  //  srand((unsigned) time(NULL));;
  
  if(input==(NULL)){
    printf("thetaのデータが見つかりませんでした。\n");
    return 0;
  }
  
  
  while((fscanf(input,"%lf",&hozon))!=EOF){
    if(hozon == count){
      i=deta(theta, ripple, input, i);
      count++;
    }
    
    if(hozon == 1.0){
      fprintf(input, "\n\n\n");
      count++;
    }
    
    else{
      detaripple(hozon,ripple,input);
    }
    
    
    printf("%lf\n",i);
    
    for(k=0; k<=N; k++)
      printf("%lf",theta[k]);
    printf("\n");
    
    for(k=0; k<N; k++){
      theta[k]=0;
    }
    for(k=0; k<M; k++)
      printf("%lf\n",ripple[k]);
    
    dousyutu(theta, ripple, kakudo);
    
    filesyuturyoku(kakudo,output);
  }
  
  fclose(input);
  fclose(output);

  return 0;
}
