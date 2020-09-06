/*
  python で出力した表データを表示用データに変換するプログラム
  引数1 変換したいファイル名
  引数2 変換結果出力ファイル名
*/


#include<stdio.h>
#include<stdlib.h>
#define SAMPLING_LATE 0.04 
#define ROW 3

int main(int argc, char *argv[]){
  //  printf("%d\n", argc);
  if(argc != 3){
    printf("%s a_file\n", argv[0]);
    return 0;
  }

  FILE *inputfp;
  if( (inputfp = fopen (argv[1], "r")) == NULL ){
    printf("not found file");
    return 0;
  }

  FILE *outputfp;
  if( (outputfp = fopen (argv[2], "w")) == NULL ){
    printf("not found file");
    return 0;
  }

  fprintf(outputfp, "ウィンドウサイズ(ms) パターン長 ダイバージェンス\n");
  
  int i=0, j=0;
  double data;
  char str[ROW][256];
  while( (fscanf(inputfp, "%s", str[(i++)%ROW])) != EOF ){
    if((i-1)%ROW == 2)
      fprintf(outputfp, "%.2f %s %s\n", atof(str[0])*SAMPLING_LATE, str[1], str[2]);      
  }
  
  fclose(inputfp);
  fclose(outputfp);
  

  return 0;
}
