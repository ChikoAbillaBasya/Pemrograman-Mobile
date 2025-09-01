class Dosen {
  late String namaDosen;
  late String nip;

  void setData(String nama, String nipDosen) {
    namaDosen = nama;
    nip = nipDosen;
  }

  void tampilkanInfo() {
    print("Nama Dosen: $namaDosen");
    print("NIP: $nip");
  }
}

void main() {
  var dosen1 = Dosen();
  dosen1.setData("Dr. Andi Pratama", "1987654321");
  dosen1.tampilkanInfo();
}