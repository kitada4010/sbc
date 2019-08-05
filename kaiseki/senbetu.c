#include<stdio.h>
#include<string.h>
#define MAX 516
int main(int argc, char *argv[]){
  char a[MAX];
  int i,j=0;
  FILE *input, *output[3];
  
  if((input=fopen(argv[1],"r"))==NULL){
    printf("ファイルが存在しません。\n");
    return 0;
  }
  sprintf(a,"base-%s",argv[1]);
  output[0]=fopen(a,"w");
  for(i=1; i<3; i++){
    sprintf(a,"%d0min-%s",i,argv[1]);
    output[i]=fopen(a,"w");
  }
  
  fgets(a,MAX,input);
  while((fgets(a,MAX,input))!=NULL){
    if(a[3]==',' && j==0){
      i++; 
      j=1;
    }
    else if(a[3]==',') 
      j=0;
    else
      fprintf(output[i%3],"%s",a);
  }
  fclose(input);
  for(i=0; i<3; i++)
    fclose(output[i]);
  return 0;
}
