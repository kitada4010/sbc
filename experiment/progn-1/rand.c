#include<stdio.h>
#include<stdlib.h>
int main(int argc, char *argv[])
{

  srand(atoi(argv[1])); //シードの設定
  for(i=0; i<10; i++){ printf("%d",rand());}

}
