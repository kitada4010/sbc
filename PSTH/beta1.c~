#include<stdio.h>

//#define FILE_NAME_MAX 256
#define SECTION_DATA_MAX 256

int main(int argc, char *argv[]){
  double data;
  double difference;
  double section[SECTION_DATA_MAX] = {0};
  int 
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
    do{
      fscanf(input, "%lf", &data);
      if((section[j] < data) && (section[j+1] > data)){
	if(difference){
	  fprintf(output,"%lf\n", data-difference);
	}
	difference = data;
      }
      else if(difference)
	difference=0;
    }while(section[j+1] > data);
    fprintf(output,"\n\n");
  }
  
  return 0;
}
