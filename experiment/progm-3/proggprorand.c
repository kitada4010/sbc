#include<stdio.h>
int main()
{
  int i,j,k,a,b,c,a1,b1,m,p,n;
  char x[20],y[20]={46},z[20],h[8],w[8];

  h[0]=1; h[1]=0; h[2]=3; h[3]=2;
  h[4]=0; h[5]=2; h[6]=0; h[7]=4;

  c=40;
  for(b=0; b<=7; b++)
    {
      w[b]=c;
      c++;
    }

  printf("Input an expression terminated with &: \n");
  
  i=0; a='#';
  while(a!='&')
    {
      a=getchar();
      x[i]=a;
      i++;
    }

  printf("\n");
  
  for(j=0; j<=i; j++)
    if(x[j]=='&')
      {
	n=j-1;
	break;
      }

  i=0; j=0; k=0; m=0; b=0; p=0;
  while(x[i]!='&')
    {
      for(b=0; b<=7; b++)
	{
	  if(x[i]==w[b])
	    {
	      m=1;
	      break;
	    }
	  m=0;
	}
      if(m==0)
	{
	  z[k]=x[i];
	  k++;
	}
      else if(x[i]=='(')
	{
	  p++;
	  j++;
	  y[j]='(';
	}
      else if(x[i]==')')
	{
	  p++;
	  while(y[j]!='(')
	    {
	      z[k]=y[j];
	      k++;
	      j--;
	    }
	  j--;
	}
      else
	{
	  a1=y[j]-40;
	  b1=x[i]-40;
	  while(h[a1]>=h[b1])
	    {
	      z[k]=y[j];
	      k++;
	      j--;
	      a1=y[j]-40;
	    }
	  j++;
	  y[j]=x[i];
	}
      i++;
    }
  while(j>=0)
    {
      z[k]=y[j];
      k++;
      j--;
    }
  n=n-p;
  printf("Reverse polish notation: \n");
  for(k=0; k<=n; k++)
    putchar(z[k]);
  putchar('\n');
}
	   
   
       
