/*
  文字が含まれていないか確認するプログラム
  引数1 確認したいファイル名
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
  //  printf("%d\n", argc);
  if(argc != 2){
    printf("%s a_file\n", argv[0]);
    return 0;
  }

  FILE *inputfp;
  if( (inputfp = fopen (argv[1], "r")) == NULL ){
    printf("not found file");
    return 0;
  }

  int i=0, j=0;
  double data;
  char str[256];
  while( (fscanf(inputfp, "%s", str)) != EOF ){
    if( (data = atof(str)) == 0 ){
      printf("%d   %s\n", i, str);
    j++;
    }

    if(j == 50){
      printf("めっちゃおおいやん¥n");
      return 0;
    }
    i++;
  }
  
  printf("%d\n", i);

  fclose(inputfp);
  

  return 0;
}
