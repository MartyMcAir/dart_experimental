// https://www.youtube.com/watch?v=nr4t0y9cY70&list=PLtUuja72DaLLAo63Zsn1UsLONDafJKWrl&index=16

void main() {
  print(greaterOrLess(1, 2));
}

String greaterOrLess(int a, int b) {
  return a == b
      ? 'numbers equals'
      : a > b
          ? 'a bigger than b'
          : 'a smaller than b';
}

String greaterOrLessSimplied(int a, int b) {
  if (a == b) return 'numbers equals';
  return a > b ? 'a bigger than b' : 'a smaller than b';
}
