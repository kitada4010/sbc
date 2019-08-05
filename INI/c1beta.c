#include<stdio.h>

//#define FILE_NAME_MAX 256
#define SECTION_DATA_MAX 256
#define DATA_NUMBER 6
//#define DATA_LEN 2048
#define DATA_LEN 512
#define MIN_LINE 0.03
#define MIN_COUNT 3

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
  FILE *ipevent, *iptime, *output, *coutfp;
  int aidafrag=0;
  int aidacount=0;
  int mcount=0;
  int midledata[DATA_LEN]={0};
  
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
	    if( outdata[k][len[k]-1] <= MIN_LINE && aidafrag!=2){
	      aidacount++;
	      aidafrag=1;
	    }
	    else if(outdata[k][len[k]-1] <= MIN_LINE && aidafrag==2){
	      aidacount++;
	    }
	    else if(outdata[k][len[k]-1] > MIN_LINE){
	      aidacount=0;
	      aidafrag=0;
	      //	      frag_data=0;
	    }
	    else
	      printf("あるやん\n");
	    printf("count:%d  frad:%d  mcount:%d isi:%lf\n",aidacount,aidafrag,mcount,outdata[k][len[k]-1]);
	    if( aidacount >= MIN_COUNT &&  aidafrag==1){
	      mcount++;
	      aidafrag=2;
	    }
	    printf("count:%d  frad:%d  mcount:%d\n\n",aidacount,aidafrag,mcount);
	  }
	  difference = data;
	}
	else if(difference)
	  difference=0.0;
      }while(section[j+1] > data);
      if(frag_data)
	outdata[k][len[k]++]=-1;
      if(mcount==0)
	midledata[((j/2)*DATA_NUMBER)+k]=-1;
      else
	midledata[((j/2)*DATA_NUMBER)+k]=mcount;
      printf("\n\ncount:%d  frad:%d  mcount:%d\n\n\n",aidacount,aidafrag, mcount);
      mcount=0;
      aidafrag=0;
      aidacount=0;
      frag_data=1;
      outdata[k][len[k]++]=0;
      outdata[k][len[k]++]=0;
      n++;
    }

    midledata[((j/2)*DATA_NUMBER)+k]=0;
    
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

  fclose(output);
  
  coutfp=fopen(argv[4],"w");
  for(i=0; i<DATA_LEN; i++){
    if(midledata[i]==-1)
      fprintf(coutfp, "0");
    else if(midledata[i]!=0)
      fprintf(coutfp, "%d", midledata[i]);
    
    if((i%DATA_NUMBER)==5)
      fprintf(coutfp, "\n");
    else
      fprintf(coutfp, ",");
    
  }
  
  
  fclose(ipevent);
  fclose(iptime);
  //  fclose(output);
  fclose(coutfp);
  return 0;
}
