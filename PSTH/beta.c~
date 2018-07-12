#include<stdio.h>

//#define FILE_NAME_MAX 256
#define SECTION_DATA_MAX 256
#define DATA_NUMBER 5
#define DATA_LEN 256

int main(int argc, char *argv[]){
  double data;
  double difference;
  double section[SECTION_DATA_MAX] = {0};
  double outdata[DATA_NUMBER][DATA_LEN] = {0};
  int i,j,k,l;
  int datafrag=0;
  int max=0;
  char gomi[DATA_LEN];
  FILE *ipevent, *iptime, *output;
  
  if((ipevent=fopen(argv[1] ,"r")) ==NULL || (iptime=fopen(argv[2], "r")) ==  NULL){
    printf("non file\n");
    return 0;
  }

  output=fopen(argv[3],"w");
  for(k=0; k<DATA_NUMBER; k++){
    i=0;
    l=0;
    do{
      fscanf(iptime,"%lf,", &section[i]);
      //printf("%lf\n",section[i]);
    }while(section[i++] != 0);
    fgets(gomi,DATA_LEN,iptime);
    fgets(gomi,DATA_LEN,iptime);
    fgets(gomi,DATA_LEN,iptime);
    
    for(j=0; j<i; j+=2){
      do{
	fscanf(ipevent, "%lf", &data);
	if((section[j] < data) && (section[j+1] > data)){
	  if(difference){
	    outdata[k][l++]=data-difference;
	  }
	  difference = data;
	}
	else if(difference)
	  difference=0;
      }while(section[j+1] > data);
      outdata[k][l++]=0;
      outdata[k][l++]=0;
    }
    fclose(ipevent);
    ipevent=fopen(argv[1], "r");
    if(max < l)
      max=l;
    l=0;
  }

  for(i=0; i<max; i++){
    for(k=0; k<DATA_NUMBER; k++){
      if(outdata[k][i]==0)
	fprintf(output, ",");
      else
	fprintf(output, "%lf,", outdata[k][i]);
    }
    fprintf(output, "\n");
    while(fgetc(iptime) != '\n' && !feof(iptime));
    while(fgetc(iptime) != '\n' && !feof(iptime));
  }
  
  fclose(ipevent);
  fclose(iptime);
  fclose(output);
  return 0;
}
