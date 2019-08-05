#include<stdio.h>

//#define FILE_NAME_MAX 256
#define SECTION_DATA_MAX 256
#define DATA_NUMBER 6
#define DATA_LEN 2048
//#define DATA_LEN 512

int main(int argc, char *argv[]){
  double data;
  double difference;
  double section[SECTION_DATA_MAX] = {0};
  double outdata[DATA_NUMBER][DATA_LEN] = {0};
  int i,j,k,n=0;
  int len[DATA_NUMBER] = {0};
  int frag_data=1;
  int datafrag=0;
  int kfrag=0;
  int max=0;
  char gomi[DATA_LEN];
  char kasu;
  FILE *ipevent, *iptime, *output;
  
  if((ipevent=fopen(argv[1] ,"r")) ==NULL || (iptime=fopen(argv[2], "r")) ==  NULL){
    printf("non file\n");
    return 0;
  }

  output=fopen(argv[3],"w");
  for(k=0; k<DATA_NUMBER; k++){
    i=0;
    //    printf("%d\n",k);
    /*
    do{
      fscanf(iptime,"%lf ,", &section[i]);
      //printf("%lf\n",section[i]);
    }while(section[i++] != 0 || section[i++] != EOF);
    fgets(gomi,DATA_LEN,iptime);
    fgets(gomi,DATA_LEN,iptime);
    fgets(gomi,DATA_LEN,iptime);
    */

    if(k>0){
      do{
	fscanf(iptime,"%c", &kasu);
	//	printf("%c",kasu);
	if(kasu =='\n')
	  kfrag++;
      }while(kfrag < 3);
      kfrag=0;
      //    while(fgetc(iptime) != '\n' && !feof(iptime));
      //fgets(gomi,DATA_LEN,iptime);
      //fgets(gomi,DATA_LEN,iptime);
      // fgets(gomi,DATA_LEN,iptime);
    }
    do{
      fscanf(iptime,"%lf,", &section[i]);
      //printf("%lf\n",section[i]);
    }while(section[i++] != 0);
    
    for(j=0; j<i-1; j+=2){
      //printf("%d...%lf\n",j,section[j]);
      do{
	fscanf(ipevent, "%lf", &data);
	if((section[j] <= data) && (section[j+1] >= data)){
	  //printf("%lf\n",section[j]);
	  if(difference){
	    outdata[k][len[k]++]=data-difference;
	    frag_data=0;
	  }
	  difference = data;
	}
	else if(difference)
	  difference=0.0;
      }while(section[j+1] > data);
      if(frag_data)
	outdata[k][len[k]++]=-1;
      frag_data=1;
      outdata[k][len[k]++]=0;
      outdata[k][len[k]++]=0;
      n++;
    }
    fclose(ipevent);
    ipevent=fopen(argv[1], "r");
    data=0.0;
    if(max < len[k])
      max=len[k];
    //  printf("kokomade\n");
    printf("%d\n",n);
    n=0;
  }
  printf("\n");
  for(i=0; i<DATA_LEN; i++){
    for(k=0; k<DATA_NUMBER; k++){
      if(outdata[k][i]==0.0 || i >= len[k])
	fprintf(output, ",");
      else if(outdata[k][i]==-1)
	fprintf(output, "none,");
      else
	fprintf(output, "%lf,", outdata[k][i]);
    }
    fprintf(output, "\n");
    //    while(fgetc(iptime) != '\n' && !feof(iptime));
    // while(fgetc(iptime) != '\n' && !feof(iptime));
  }
  
  fclose(ipevent);
  fclose(iptime);
  fclose(output);
  return 0;
}
