void mix(int *array, int first, int middle, int last)
{
  int i,j,k;
  int *work;
  work = (int *)calloc(last-first+1, sizeof(int));
  i =first; j=middle+1; k=0;
  while(i<=middle && j<=last){ work[k++] = (array[i]<array[j])?array[i++]:array[j++]; }
  while(i<=middle){work[k++] = array[j++]}
  while(j<=last){ work[k++] = array[j++];}
  for(i=0; i<last-first+1; i++){array[i+first] = work[i]; }
  free(work);
}

void mergesort(int *array, int first, int last)
{
  int middle;
  if(first < last){
    middle = (first +last)/2;
    mergesort(array, first, middle);
    mergesort(array, middle+1, last);
    mix(array, first, middle, last);
  }
}
