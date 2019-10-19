/*
  引数1 データ取り開始時間
  引数2 データ取り終了時間
  引数3 リップル開始時間
  引数4 リップル終了時間
  引数5 つけたいラベル境界部分はプラス1  (リップルの時1  ノイズの時2)
  引数6 出力ファイル名
  引数7 サンプリング周波数(25000 or 16666)
*/


#include<stdio.h>
#include<stdlib.h>
int main(int argc, char *argv[]){
  if(argc != 8){
    printf("%s start_time endtime start_event end_event label_number rat_number\n", argv[0]);
    return 0;
  }
  
  int fs = 100000; //データの整数か
  //  int sr; //サンプリング周波数
  int step; //飛ばすデータ数
  double grayarea = 0.005; //グレーゾーンの絶対値範囲(合計範囲/2)
  
  int i, label, output;
  double starttime, endtime, startevent, endevent;
  if( (starttime = atof(argv[1]))<=0 || (endtime = atof(argv[2]))<=0 || (startevent = atof(argv[3]))<=0 || (endevent= atof(argv[4]))<=0 || (label = atoi(argv[5])) <=0 || (step = atoi(argv[7])) <=0 ){
    printf("input error\n");
    return 0;
  }
  
  if( (starttime >= startevent) || (startevent >= endevent) || (endevent >= endtime) ){
    printf("input size error\n");
  }

  /*
  if(sr == 25000)
    step = 90;
  else if(sr == 16666)
    step = 60;
  else{
    printf("not faund sampling rate");
    return 0;      
  }
  */
  
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
  //  leng = leng+step;
  //  leng += 0.99;
  
  double startleng;
  startleng = startevent - starttime;
    
  double endleng;
  endleng = endevent - starttime;
  
  double grayleng;
  
  printf("%d\n", (int)leng/step);
  
  for(i=0; i<=((int)leng)-4; i+=step){
    //    printf("%d\n",(int)((startleng-grayarea)*fs));
    //printf("%d\n",(int)((startleng+grayarea)*fs));
    //printf("%d\n",(int)((endleng-grayarea)*fs));
    
    if( ( (int)((startleng-grayarea)*fs) <= i && (int)((startleng+grayarea)*fs) >= i ) || ( (int)((endleng-grayarea)*fs) <= i && (int)((endleng+grayarea)*fs) >= i )){
      output = label + 1;
    }
    else if( (int)((startleng+grayarea)*fs) <= i && (int)((endleng-grayarea)*fs) >= i ){
      output = label;
    }
    else{
      output = 0;
    }
    fprintf(labelfile, "%d\n", output);
    //    if(i == ((int)leng)+40)
    //  break;
  }
  
  fclose(labelfile);
  return 0;
}
