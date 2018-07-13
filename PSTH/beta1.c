#include<stdio.h>

//#define FILE_NAME_MAX 256
#define SECTION_DATA_MAX 256
#define H 0.1

int main(int argc, char *argv[]){
  double data=0;
  double difference;
  double hd;
  double start;
  double section[SECTION_DATA_MAX] = {0};
  int spike=0;
  int i=0,j=0;
  int datafrag=0;
  FILE *input, *output;
  
  if((input=fopen(argv[1] ,"r")) ==NULL){
    printf("non file\n");
    return 0;
  }
  
  printf("section data:");
  
  do{
    scanf("%lf", &section[i]);
  }while(section[i++] != 0);
  //printf("\n\n");
  
  
  output=fopen(argv[2],"w");
  
  for(j=0; j<i; j+=2){
    start=section[j+1]-section[j];
    start-=(int)start;
    printf("%lf\n",start);
    
    while(section[j]+start>data)
      fscanf(input,"%lf ",&data);
    
    for(hd=(section[j]+start); hd<=section[j+1]; hd+=H){
      if(hd<data && (hd+H)>=data){
	while(hd<data && (hd+H)>=data){
	  spike++;
	  fscanf(input,"%lf ",&data);
	}
    }
      else if(hd+H>data)
	fscanf(input,"%lf ",&data);
      fprintf(output,"%lf,%lf\n", hd, (spike*(1.0/H)));
      spike=0;
    }
    
    
    fprintf(output,"\n\n");
  }
  
  return 0;
}
