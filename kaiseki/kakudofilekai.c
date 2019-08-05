#include<stdio.h>
#define N 40
#define M 4

void kakudodousyutu(int l, int  m, const double theta[], const double ripple[],double kakudo[]){
  
  int i, ih, j, k;
  
  for(i=0; i<l; i++)
    if(theta[i]>=ripple[0])
      break;
  ih=i;
  
  kakudo[0]=(ripple[0]-theta[i-1]) * (180/ (theta[i]-theta[i-1]) );
  if(ih%2==1)
    kakudo[0]-=180;
  
  for(j=1; j<=m; j++){
    
    for(k=i; k<N; k++)
      if(theta[k]>=ripple[j])
        break;
    
    kakudo[j]=(ripple[j]-theta[k-1]) * (180/ (theta[k]-theta[k-1]) );
    
    if(ih%2==1)
      kakudo[j]+=(180*(k-i-1));
    else
      kakudo[j]+=(180*(k-i));
    
  }
}

/*---------------------------------------------------------------------------------------------------------------------------*/

int main(void){
  
  int i=0,  m, j;
  double h, hh, theta[N], ripple[M], kakudo[N], s=2.0;
  FILE *input, *output;
  
  input =fopen("theta.txt","r");
  output =fopen("kakudo.txt","w");
  
  OAfscanf(input,"%lf",&theta[0]);
  fscanf(input,"%lf",&h);
  
  //  printf("%lf\n",theta[0]);
  
  do{
    for(j=1; j<=i; j++)
      theta[j]=0;
    
    
    
    theta[0]=h;
    
    for(i=1; i<N; i++){
      fscanf(input,"%lf",&theta[i]);
      //    printf("%lf\n",theta[i]);
      if(theta[i-1]>theta[i])
	break;
    }
    
    
    
    h=theta[i];
    theta[i]=0;
    
    
    
    do{
      
      hh=h;
      
      ripple[0]=h;
      fscanf(input,"%lf",&ripple[1]);
      ripple[2]=(ripple[0]+ripple[1])/2;
      
      if( fscanf(input,"%lf",&ripple[3]) ==EOF){
	s=-10.0;
	ripple[3]=0;
	m=2;
      }
      
      //      printf("%lf   ",h);
      
      //      for(j=0; j<=m; j++)
      //	printf("%lf ",ripple[j]);
      
      else if(ripple[3]<ripple[0] || ripple[3]>ripple[1]){
	h=ripple[3];
	ripple[3]=0;
	m=2;
	//	printf("%lf\n  ",h);
      }
      
      else {
	fscanf(input,"%lf",&h);
	m=3;  
	
	//	printf("%lf  ",h);
	
      }
      
      //printf("%lf   ",h);
      
      // for(j=0; j<=m; j++)
      //	printf("%lf ",ripple[j]);
      
      //   for(m=0; m<i; m++)
      //  printf("%lf",theta[i]);
      
      kakudodousyutu(i-1, m, theta, ripple, kakudo);
      
      for(j=0; j<=m; j++)
	fprintf(output,"%lf      ",kakudo[j]);
      fprintf(output,"\n");
      
      printf("%lf\n",h);
      
      
      // if(theta[0]<=h && theta[i-1]>=h){  //ここがおかしい気が
      
      //  }
      /*      else if(h!=1.0){
	      s=2.0;
	      fprintf(output,"\n\n\n");
	}*/
      
      
      /* 
	 while(h==s-1 && h==1.0)
	 if( fscanf(input,"%lf",&h) ==EOF )
	  s=-1;
      */    
      
      for(j=0; j<=i; j++)
	printf("%lf",theta[j]);
      printf("\n");
      
      
    }while( (theta[1]<=h || theta[0]<=h) && theta[i-1]>=h && hh!=h); 
    
    //    printf("%lf ",s);
    
    if(h==1.0){
      s=1.0;
      fprintf(output,"\n\n\n");
    }
    else if(s>0)
      s+=1.0;
    
    //    printf("%lf",h);
    else if(theta[1]>h)
      if( fscanf(input,"%lf",&h)==EOF ){
	break;
	s=-10.0;
      }
    // printf("%lf\n",s);
    
    //    printf("%lf",h);
    
  }while(s>=1.0);
  
  fclose(output);
  fclose(input);
  
  return 0;
}
