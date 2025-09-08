void main() {
  String nama = "Chiko Abilla Basya";
  String nim = "2341720005";

  print("Bilangan Prima dari 0 sampai 201:\n");

  for (int i = 0; i <= 201; i++) {
    if (isPrima(i)) {
      print("$i adalah bilangan prima");
      print("Nama  : $nama");
      print("NIM   : $nim\n");
    }
  }
}

bool isPrima(int n) {
  if (n < 2) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}