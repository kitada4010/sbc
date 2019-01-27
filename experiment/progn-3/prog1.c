/*
水平垂直パリティ検査符号の符号化と復号
 */
#include<stdio.h>
#include<stdlib.h>
#define K 4 //情報点数
#define N 9 //符号語長

static int P[N][N-K] =
  {{1, 0, 1, 0, 0},
   {1, 0, 0, 1, 0},
   {0, 1, 1, 0, 0},
   {0, 1, 0, 1, 0},
   {1, 0, 0, 0, 1},
   {0, 1, 0, 0, 1},
   {0, 0, 1, 0, 0},
   {0, 0, 0, 1, 0},
   {0, 0, 0, 0, 1}};

//長さ leng の配列 s[] を表示する
void PrintVec(int *s, int leng)
{
  int i;
  for(i=0; i<leng; i++){
    printf(" %d", s[i]);
  }

  puts("");
}

void Encoder(int *d, int *x)
{
  int i;
  int p[N-K];  //検査部冗長性()

  //検査部の計算
  p[0] = d[0] ^ d[1];
  p[1] = d[2] ^ d[3];
  p[2] = d[0] ^ d[2];
  p[3] = d[1] ^ d[3];
  p[4] = p[0] ^ p[1];
  //符号語への変換
  for(i=0; i<K; i++){
    x[i] = d[i];
  }
  for(i=0; i<N-K; i++){
    x[i+K] = p[i];
  }
}

void Syndrome(int *y, int *s)
{
  s[0] = y[0] ^ y[1] ^ y[4];
  s[1] = y[2] ^ y[3] ^ y[5];
  s[2] = y[0] ^ y[2] ^ y[6];
  s[3] = y[1] ^ y[3] ^ y[7];
  s[4] = y[4] ^ y[5] ^ y[8];
}

/*
長さ leng の配列 s[], p[] を比較する一致していれば0を返し、一致していなければ0以外を返す。
*/
int Diff(int *s, int *p, int leng)
{
  int i;
  int r = 0;
  for(i=0; i<leng; i++){
    r += s[i] ^ p[i];
  }
  return r;
}

/*
  長さleng の配列が全ゼロか判定
  全ゼロならば 0 を返し
  全ゼロでなければ 1 を返す
 */
int Zero(int *s, int leng)
{
  int i;
  for(i=0; i<leng; i++){
    if(s[i] != 0){ return 1; }
  }
  return 0;
}

void Decode(int *y, int *s, int *h)
{
  int i;
  int posi = N; //推定した誤り位置

  for(i=0; i<N; i++){ // 推定語の初期化
    h[i] = y[i];
  }
  
  for(i=0; i<N; i++){
    if(Diff(s,P[i], N-K) == 0){
      posi = i;
      break;
    }
  }
  if( posi == N){
    if(Zero(s, N-K) == 0){ //誤りがない場合
      return ;
    }
    else{ //訂正できないが誤りを検出した場合
      printf("誤り検出\n");
      return ;
    }
  }

  //誤りの位置を反転
  h[posi] ^= 1;
}

int main(void)
{
  int d[K]; // メッセージ
  int x[N]; // 符号語
  int e[N]; // 誤りベクトル
  int y[N]; // 受信語
  int s[N-K]; // シンドローム
  int h[N]; // 推定語
  int i, j, k;
  
  // 元の情報の入力
  printf("%d bit 分のメッセージを入力: ",K);
  for(i=0; i<K; i++){
    scanf("%d", &d[i]);
  }

  //符号語の作成
  Encoder(d, x);

  //符号語の表示
  printf(" 符号語:");
  PrintVec(x, N);

  for(j=0; j<N; j++)
    e[j]=x[j];
      
  for(j=0; j<N; j++){
    for(k=j+1; k<N; k++){
      e[j] ^= 1;
      e[k] ^= 1;
      /*
      //誤りベクトルの入力
      printf("%d bit 分の誤りベクトルを入力:",N);
      for(i=0; i<N; i++){
      scanf("%d", &e[i]);
      }
      */
      //受信語の作成
  for(i=0; i<N; i++){
    y[i] = x[i] ^ e[i];
  }

  //受信語の表示
  printf(" 受信語: ");
  PrintVec(y, N);

  //シンドロームの計算
  Syndrome(y, s);

  printf("Syndrome: ");
  PrintVec(s, N-K);
  
  //復号
  Decode(y, s, h);
  
  /*
  //推定語の表示
  printf(" 推定語: ");
  PrintVec(h, N);
  */
  e[j] ^= 1;
  e[k] ^= 1;
    }
  }
  return 0;
}
