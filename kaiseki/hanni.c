#include<stdio.h>
//#include<stdlibe.h>
#define MAX 800
#define MIN 180
#define A 256
//#define MOJI 256
int main (int argc, char *argv[]){
  int kakudo[MAX]={0}, i;
  double start, end, maxend=0, minstart=0, top, center;
  FILE *input, *output;
  //  char a[A];
  
  if((input=fopen(argv[1],"r"))==NULL){
    printf("ファイルが存在しません。\n");
    return 0;
  }
  
  output=fopen(argv[2],"w");
  
  while(fscanf(input,"%lf,%lf,%lf,%lf",&start,&end,&center,&top)!=EOF){
    //printf("rppleの初めと終わり");
    //scanf(" %lf, %lf",&start,&end);
    if(maxend<end)
      maxend=end;
    if(minstart>start)
      minstart=start;
    for(i=start; i<end; i++){
      kakudo[i+MIN]++;
    }
  }
  
  for(i=minstart+MIN; i<maxend+MIN+1; i++)
    fprintf(output,"%d, %d\n",i-MIN,kakudo[i]);
  
  fclose(input);
  fclose(output);
  return 0;
}

