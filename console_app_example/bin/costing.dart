void main() {
  int a = 1;
  int b = 1;

// explicit typing
  double c = a.toDouble() + b.toDouble();
  print(c);
  print(c.runtimeType);

  //
  double c2 = a + b as double;
}

double convertBoolToDouble(bool value) {
  if (value) return 1;
  return 0;
}
