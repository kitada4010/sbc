#include<stdio.h>
#include<string.h>

//#define FILE_NAME_MAX 256
#define SECTION_DATA_MAX 256
#define DATA_NUMBER 5
#define DATA_LEN 256
#define H 0.1

int main(int argc, char *argv[]){
  double data;
  double difference;
  double hd;
  double start;
  double t=1.0/H;
  double section[SECTION_DATA_MAX] = {0};
  double outdata[DATA_NUMBER][DATA_LEN] = {0};
  int i,j,k,l;
  int datafrag=0;
  int spike;
  char gomi[DATA_LEN];
  char kasu;
  char file_name[DATA_LEN];
  FILE *ipevent, *iptime, *output[DATA_NUMBER];
  
  
  if((ipevent=fopen(argv[1] ,"r")) ==NULL || (iptime=fopen(argv[2], "r")) ==  NULL){
    printf("non file\n");
    return 0;
  }

  for(i=0; i<DATA_NUMBER; i++){
    sprintf(file_name,"%d-%s",(i+1),argv[3]);
    output[i]=fopen(file_name,"w");
  }
  for(k=0; k<DATA_NUMBER; k++){
    i=0;
    l=0;

    if(k>0){
      do{
	fscanf(iptime,"%c,", &kasu);
      }while(kasu!='\n');
      //    while(fgetc(iptime) != '\n' && !feof(iptime));
      fgets(gomi,DATA_LEN,iptime);
      fgets(gomi,DATA_LEN,iptime);
      // fgets(gomi,DATA_LEN,iptime);
    }
    do{
      fscanf(iptime,"%lf,", &section[i]);
      printf("%lf\n",section[i]);
    }while(section[i++] != 0);
   
    
    for(j=0; j<i; j+=2){
      start=section[j+1]-section[j];
      start-=(int)start;
      while(section[j]+start>data)
	fscanf(ipevent, "%lf ", &data);
      spike=0;
      for(hd=(section[j]+start); hd<=section[j+1]; hd+=H){
	if(hd<data && (hd+H)>=data){
	  while(hd<data && (hd+H)>=data){
	    printf("%d",spike++);
	    fscanf(ipevent,"%lf ",&data);
	  }
	}
	else if(hd+H>data)
	  fscanf(ipevent,"%lf ",&data);
	fprintf(output[k],"%lf,%lf\n", hd, ((double)spike*t));
	spike=0;
      }
      
      fprintf(output[k],",\n,\n");
    } 
    
    fclose(ipevent);
    ipevent=fopen(argv[1], "r");
  }
  
    
  fclose(ipevent);
  fclose(iptime);
  for(k=0; k<DATA_NUMBER; k++)
    fclose(output[k]);
  return 0;
}
