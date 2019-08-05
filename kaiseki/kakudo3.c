#include<stdio.h>
#include<time.h>
#define N 40
#define M 3


/*------------------------------------------------------------------------*/
int main(void){
  

  double i;
  
  FILE *input, *output;
  
  input =fopen("tamesii.txt","r");
  output =fopen("tamesio.txt","w");
  
  //  srand((unsigned) time(NULL));;
  
  if(input==(NULL)){
    printf("thetaのデータが見つかりませんでした。\n");
    return 0;
  }
  
  while((fscanf(input,"%lf",&i))!=EOF){
    fprintf(output,"%lf",i);
  }
  
  
  fclose(input);
  fclose(output);
  
  return 0;
}
