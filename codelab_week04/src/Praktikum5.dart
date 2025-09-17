void main() {
  // Langkah 1
  var record = ('first', a: 2, b: true, 'last');
  print('Record awal: $record');

  // Langkah 3 - Menggunakan fungsi tukar
  (int, int) tukar((int, int) record) {
    var (a, b) = record;
    return (b, a);
  }

  var angka = (5, 10);
  print('Sebelum ditukar: $angka');
  var hasilTukar = tukar(angka);
  print('Setelah ditukar: $hasilTukar');

  // Langkah 4 - Record type annotation
  (String, int) mahasiswa;
  mahasiswa = ('Chiko Abilla Basya', 2341720005);
  print('Data mahasiswa: $mahasiswa');

  // Langkah 5 - Akses field record
  var mahasiswa2 = ('Chiko Abilla Basya', a: 2341720005, b: true, 'Politeknik Negeri Malang');

  print('Nama: ${mahasiswa2.$1}');     
  print('NIM: ${mahasiswa2.a}');       
  print('Status: ${mahasiswa2.b}');   
  print('Kampus: ${mahasiswa2.$2}');   
}