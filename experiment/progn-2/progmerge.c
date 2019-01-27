#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define N 1000000
void mix(int *array, int first, int middle, int last)
{
  int i,j,k;
  int *work;
  work = (int *)calloc(last-first+1, sizeof(int));
  i =first; j=middle+1; k=0;
  while(i<=middle && j<=last){ work[k++] = (array[i]<array[j])?array[i++]:array[j++]; }
  while(i<=middle){work[k++] = array[i++];}
  while(j<=last){ work[k++] = array[j++];}
  for(i=0; i<last-first+1; i++){array[i+first] = work[i]; }
  free(work);
}

void mergesort2(int *array, int first, int last)
{
  int middle;
  if(first < last){
    middle = (first +last)/2;
    mergesort2(array, first, middle);
    mergesort2(array, middle+1, last);
    mix(array, first, middle, last);
  }
}

/*---------------------------------------------------------------*/
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
  mergesort2(a,0,n-1);
  e_time = clock();  //終了時刻

  printf("マージソート\n");
  /* for(i=0; i<n; i++)
    printf("%d\n",a[i]);
  */
  printf("時間計算量\n%lf [sec]\n",(double)(e_time-s_time)/CLOCKS_PER_SEC);

  return 0;
}

