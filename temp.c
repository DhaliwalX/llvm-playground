struct foo {
  double a;
  int *b;
  int *c[100];
};

int main() {
   int a = 10;
   int **b;
   int *c = &a;
   b = &c;
   b--;
   struct foo bar;

   bar.b = c;
   bar.c[23] = c;
}
