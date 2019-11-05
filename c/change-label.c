/*
  引数1 変更したいファイル
  引数2 足す値
*/


#include<stdio.h>
#include<stdlib.h>
int main(int argc, char *argv[]){
  if(argc != 3){
    printf("%s start_time endtime start_event end_event label_number rat_number\n", argv[0]);
    return 0;
  }

  int add;
  if( ( (add = atoi(argv[1])) <=0 ){
    printf("input error\n");
    return 0;
  }
  
  if( (starttime >= startevent) || (startevent >= endevent) || (endevent >= endtime) ){
    printf("input size error\n");
  }
  
  FILE *labelfile;
  char filename[256];
  sprintf(filename, "%s-%s-%s-label.csv", argv[6], argv[1], argv[2]);
  //printf("%s",filename);
  
  if((labelfile = fopen(filename, "w")) == NULL){
    printf("can not open file\n");
    return 0;
  }


  
  double leng;
  leng = endtime - starttime;
  //  printf("%lf\n",leng);
  
  //printf("%lf\n",leng);
  
  /* if( ((int)(leng*4*fs))%4 == 0  ){ */
  /*   leng+=(1.0/fs); */
  /*   printf("%s\n",filename); */
  /* } */
  
  //leng+=(1.0/fs);
  
  leng *= fs;
  leng += 0.99;
  
  double startleng;
  startleng = startevent - starttime;
    
  double endleng;
  endleng = endevent - starttime;
  
  double grayleng;
  
  printf("%d\n", (int)leng);
  
  for(i=0; i<(int)leng; i++){
    //    printf("%d\n",(int)((startleng-grayarea)*fs));
    //printf("%d\n",(int)((startleng+grayarea)*fs));
    //printf("%d\n",(int)((endleng-grayarea)*fs));
    
    if( ( (int)((startleng-grayarea)*fs) <= i && (int)((startleng+grayarea)*fs) >= i ) || ( (int)((endleng-grayarea)*fs) <= i && (int)((endleng+grayarea)*fs) >= i )){
      output = label + 2;
    }
    else if( (int)((startleng+grayarea)*fs) <= i && (int)((endleng-grayarea)*fs) >= i ){
      output = label;
    }
    else{
      output = 0;
    }
    fprintf(labelfile, "%d\n", output);
  }
  
  fclose(labelfile);
  return 0;
}
