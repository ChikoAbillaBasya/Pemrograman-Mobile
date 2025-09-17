void main() {
  String city = 'Surabaya'; // variabel non-null
  String? district; // variabel nullable

  print('Kota: $city');
  print('Kecamatan: ${district ?? 'Belum dipilih'}');
}