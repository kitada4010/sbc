#include<stdio.h>
#include<math.h>

#define FILEDATA 2374
#define TS 2226.8356
#define TE 2226.978
#define DT 0.00006

int main(void){
  FILE *input, *output;
  double re=0, im=0, f[FILEDATA]={0}, T0=(TE-TS);
  int k, n;

  input =fopen("sample10_data.dat","r");
  output =fopen("fourier_sample10_data.dat","w");

  if(input==(NULL)){
    printf("thetaのデータが見つかりませんでした。\n");
    return 0;
  }

  for(k=0; k<FILEDATA; k++)
    fscanf(input, "%lf", &f[k]);

  for(k=0; k<FILEDATA; k++){
    //  fscanf(input,"%lf",&f);                                                                            
    for(n=0; n<FILEDATA; n++){
      re+=f[n]*cos((2.0*M_PI*(double)k*(double)n)/(double)FILEDATA);
      im-=f[n]*sin((2.0*M_PI*(double)k*(double)n)/(double)FILEDATA);
    }
    fprintf(output,"%d  %lf  %lf   %lf\n",k,re,im,sqrt(re*re+im*im));
    re=0;
    im=0;
  }

  fclose(input);
  fclose(output);
  return 0;
}
