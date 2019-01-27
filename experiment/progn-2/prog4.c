#include <stdio.h>
#include<time.h>
int main(int argc, char *argv[])
{
  clock_t s_time, e_time;
  
  s_time = clock();  //開始時刻
  mergesort(array, 0, length-1);
  e_time = clock();  //終了時刻
  printf("%lf [sec]\n",(double)(e_time-s_time)/CLOCKS_PER_SEC);

}
