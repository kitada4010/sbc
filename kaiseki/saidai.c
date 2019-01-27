#include<stdio.h>
#include<math.h>
#define FILEDATA 20
#define FILES 0
#define SAMPLE 20000

int main(void){

  int max = SAMPLE*FILEDATA, min = SAMPLE*FILES, sums=SAMPLE*(FILEDATA-FILES);
  long long i;
  double data, saidai=0.0;
  FILE *input, *output;
  
  input =fopen("fourier_11_0008_data.dat","r");
  
  for(i=FILES; i<(max*4); i++){
    fscanf(input,"%lf",&data);
    if(i%4==1){
      if(data>saidai)
	saidai=data;
    }
  }
  
  printf("%lf\n",saidai);
  fclose(input);
  
  return 0;
}
