#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define N 100000
void bubblesort(int *array, int length){
  int i,j,tmp;
  for(i=0; i<length; i++){
    for(j=0; j<length-i-1; j++){
      if(array[j] > array[j+1]){
	tmp = array[j];
	array[j] = array[j+1];
	array[j+1] =tmp;
      }
    }
  }
}

/*---------------------------------------------------*/
int main(int argc, char *argv[]){
  int i, n, a[N];
  clock_t s_time, e_time;
  
  srand(atoi(argv[1]));  //ジードの設定                                                                                                                                          
  
  printf("数列の長さ:"); scanf("%d",&n);
  
  for(i=0; i<n; i++){ 
    a[i] = rand();
  }
  
  /* for(i=0; i<n; i++)
     printf("%d\n",a[i]);
  */
  s_time = clock();  //開始時刻
  bubblesort(a,n);
  e_time = clock();  //終了時刻 
  
  printf("バブルソート\n");
  /*  for(i=0; i<n; i++)
    printf("%d\n",a[i]);
    */
  printf("時間計算量\n%lf [sec]\n",(double)(e_time-s_time)/CLOCKS_PER_SEC);

  return 0;
}
