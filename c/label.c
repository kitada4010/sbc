#include<stdio.h>
#include<stdlib.h>
int main(int argc, char *argv[]){
  if(argc != 6){
    printf("%s start_time end_time start_event end_event label_number\n", argv[0]);
    return 0;
  }
  
  int fs = 25; //データを取る間隔の周波数
  double gray_area = 0.05; //グレーゾーンの絶対値範囲(合計範囲/2)
  
  int i, label, output;
  double start_time, end_time, start_event, end_event;
  if( (start_time = atof(argv[1]))<=0 || (end_time = atof(argv[2]))<=0 || (start_event = atof(argv[3]))<=0 || (end_event= atof(argv[4]))<=0 || (label = atoi(argv[5])) <=0 ){
    printf("input error\n");
    return 0;
  }
  if( (start_time >= start_event) || (start_event >= end_event) || (end_event >= end_time) ){
    printf("input size error\n");
  }

  FILE *labelfile;
  char *filename;
  sprintf(filename, "B39-%s-%s-label.csv", argv[1], argv[2]);
  
  if((labelfile = fopen(filename, "w")) == NULL){
    printf("can not open file\n");
    return 0;
  }


  
  double leng;
  leng = end_time - start_time;
  leng *= fs;

  double start_leng;
  start_leng = start_event - start_time;
    
  double end_leng;
  end_leng = end_event - start_time;
  
  double gray_leng;

  
  

  for(i=0; i<leng; i++){
    if( ( (int)((start_leng-gray_area)*fs) >= i && (int)((start_leng+gray_area)*fs) <= i )|| ( (int)((end_leng-gray_area)*fs) >= i && (int)((end_leng+gray_area)*fs) <= i )){
      output = label + 2;
    }
    if( (int)((start_leng+gray_area)*fs) >= i && (int)((end_leng-gray_area)*fs) <= i ){
      output = label;
    }
    else output = 0;
    fprintf(labelfile, "%d\n", output);
  }
  
  fclose(labelfile);
  return 0;
}
