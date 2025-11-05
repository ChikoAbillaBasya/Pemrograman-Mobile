<div align="center">

# LAPORAN PRAKTIKUM

## PEMROGRAMAN MOBILE

<img src="https://3.bp.blogspot.com/-whSxEvHuEds/VOBUC7I5NNI/AAAAAAAAAUY/qfk23ch5o_c/s1600/logo_polinema_by_adminkerapolinema-d3b0ojd.jpg" alt="Logo Polinema" width="140"/>

---

## JOBSHEET 9

### Pemrograman Asynchronous

---

**Dosen Pengampu:**  
Habibie Ed Dien, S.Kom., M.T.

---

**Disusun oleh:**  
Chiko Abilla Basya  
2341720005  
TI-3G  
D-4 Teknik Informatika  
Politeknik Negeri Malang

---

Jl. Soekarno Hatta No.9, Jatimulyo,  
Kec. Lowokwaru, Kota Malang, Jawa Timur 65141

Phone: (0341) 404424, 404425  
Email: [Polinema.ac.id](https://www.polinema.ac.id)

</div>

---

## **Praktikum 1: Mengunduh Data dari Web Service (API)**

Selesaikan langkah-langkah praktikum berikut ini menggunakan editor Visual Studio Code (VS Code) atau Android Studio atau code editor lain kesukaan Anda. Jawablah di laporan praktikum Anda pada setiap soal yang ada di beberapa langkah praktikum ini.

>**Perhatian**: Diasumsikan Anda telah berhasil melakukan setup environment Flutter SDK, VS Code, Flutter Plugin, dan Android SDK pada pertemuan pertama.

### **Langkah 1: Buat Project Baru**
Buatlah sebuah project flutter baru dengan nama **books** di folder **src week-11** repository GitHub Anda.

![alt text](books/images/books.png)

Kemudian Tambahkan dependensi `http` dengan mengetik perintah berikut di terminal.
```dart
flutter pub add http
```
![alt text](books/images/plugin_http.png)

### **Langkah 2: Cek file pubspec.yaml**
Jika berhasil install plugin, pastikan plugin `http` telah ada di file `pubspec` ini seperti berikut.
```dart
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0
```
**Jika Anda menggunakan macOS**, Anda harus mengaktifkan fitur networking pada file `macos/Runner/DebugProfile.entitlements` dan `macos/Runner/Release.entitlements` dengan menambahkan kode berikut:

![alt text](books/images/macos.png)

### **Langkah 3: Buka file main.dart**
Ketiklah kode seperti berikut ini.

>#### **Soal 1**
>Tambahkan **nama panggilan Anda** pada `title` app sebagai identitas hasil pekerjaan Anda.
```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'paxkage:http/http.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Back from the Future - Chiko')),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(child: const Text('GO!'), onPressed: () {}),
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
```

>#### **Catatan:**
>Tidak ada yang spesial dengan kode di `main.dart` tersebut. Perlu diperhatikan di kode tersebut terdapat widget `CircularProgressIndicator` yang akan menampilkan animasi berputar secara terus-menerus, itu pertanda bagus bahwa aplikasi Anda responsif (tidak freeze/lag). Ketika animasi terlihat berhenti, itu berarti UI menunggu proses lain sampai selesai.

### **Langkah 4: Tambah method getData()**
Tambahkan method ini ke dalam `class _FuturePageState` yang berguna untuk mengambil data dari API Google Books.
```dart
Future<Response> getData() async {
  const authority = 'www.googleapis.com';
  const path = '/books/v1/volumes/junbDwAAQBAJ';
  Uri url = Uri.https(authority, path);
  return http.get(url);
}
```

>#### **Soal 2**
>* Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel `path` di kode tersebut. Caranya ambil di URL browser Anda seperti gambar berikut ini.
>![alt text](books/images/id_buku.png)
>* Kemudian cobalah akses di browser URI tersebut dengan lengkap seperti ini. Jika menampilkan data JSON, maka Anda telah berhasil. Lakukan capture milik Anda dan tulis di `README` pada laporan praktikum. Lalu lakukan commit dengan pesan "**W11: Soal 2**".
>![alt text](books/images/hasil_praktikum1_soal2.png)

### **Langkah 5: Tambah kode di ElevatedButton**
Tambahkan kode pada `onPressed` di `ElevatedButton` seperti berikut.
```dart
ElevatedButton(
  child: Text('GO!'),
  onPressed: (){
    setState(() {});
    getData()
    .then((value) {
      result = value.body.toString().substring(0, 450);
      setState(() {});
    }).catchError((_){
      result = 'An error occurred';
      setState(() {});
    });
  },
),
```
Lakukan run aplikasi Flutter Anda. Anda akan melihat tampilan akhir seperti gambar berikut. Jika masih terdapat error, silakan diperbaiki hingga bisa running.

>#### **Soal 3**
>* Jelaskan maksud kode langkah 5 tersebut terkait `substring` dan `catchError`!
>
>**Jawab:**
>
>**Penjelasan `substring(0, 450)`:**
>- Method `substring(0, 450)` digunakan untuk **memotong string** dari response body API
>- Angka `0` adalah **index awal** (karakter pertama)
>- Angka `450` adalah **index akhir** (karakter ke-450)
>- Fungsinya untuk **membatasi panjang text** yang ditampilkan karena response JSON dari Google Books API sangat panjang (bisa ribuan karakter)
>- Jika tidak dibatasi, text akan memenuhi layar dan membuat UI tidak rapi
>- Dengan membatasi 450 karakter, kita hanya menampilkan sebagian data untuk preview
>
>**Penjelasan `catchError`:**
>- `catchError()` adalah method untuk **menangani error** (error handling) pada operasi asynchronous
>- Jika terjadi error saat proses `getData()` (misal: tidak ada koneksi internet, timeout, API error, dll), maka blok `catchError` akan dieksekusi
>- Parameter `(_)` menggunakan underscore karena kita tidak menggunakan object error-nya
>- Di dalam catchError, kita set `result = 'An error occurred'` untuk memberi tahu user bahwa terjadi kesalahan
>- `setState()` dipanggil untuk memperbarui UI dan menampilkan pesan error
>
>**Alur kerja kode:**
>1. User menekan tombol "GO!"
>2. `setState()` pertama dipanggil untuk trigger rebuild (opsional)
>3. `getData()` dipanggil secara asynchronous (mengambil data dari API)
>4. **Jika berhasil**: 
>    - `.then()` dijalankan
>    - Response body diambil 450 karakter pertama
>    - Disimpan ke variabel `result`
>    - `setState()` dipanggil untuk update UI
>5. **Jika gagal**:
>    - `.catchError()` dijalankan
>    - `result` diisi dengan pesan error
>    - `setState()` dipanggil untuk update UI
>
>* Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "**W11: Soal 3**".

![alt text](books/images/hasil_praktikum1_soal3.gif)

**Penjelasan hasil:**
- Saat aplikasi pertama kali dibuka, menampilkan tombol "GO!" dan CircularProgressIndicator
- Ketika tombol "GO!" ditekan, aplikasi melakukan request ke Google Books API
- Setelah data berhasil diambil, ditampilkan 450 karakter pertama dari response JSON
- CircularProgressIndicator tetap berputar menunjukkan aplikasi tetap responsif

## **Praktikum 2: Menggunakan await/async untuk menghindari callbacks**
Ada alternatif penggunaan Future yang lebih clean, mudah dibaca dan dirawat, yaitu pola **async/await**. Intinya pada dua kata kunci ini:
* `async` digunakan untuk menandai suatu method sebagai asynchronous dan itu harus ditambahkan di depan kode function.
* `await` digunakan untuk memerintahkan menunggu sampai eksekusi suatu function itu selesai dan mengembalikan sebuah value. Untuk then bisa digunakan pada jenis method apapun, sedangkan await hanya bekerja di dalam method async.
Berikut ini contoh kode perbedaan Future dengan then dan async/await.

Berikut ini contoh kode perbedaan `Future` dengan `then` dan `async/await`.

![alt text](books/images/future.png)

Untuk memahami lebih dalam penggunaan **async/await**, simaklah video berikut.

[![alt text](books/images/async_await.png)](https://youtu.be/SmTCmDMi4BY) 

Setelah Anda menyelesaikan praktikum 1, Anda dapat melanjutkan praktikum 2 ini. Selesaikan langkah-langkah praktikum berikut ini menggunakan editor Visual Studio Code (VS Code) atau Android Studio atau code editor lain kesukaan Anda. Jawablah di laporan praktikum Anda pada setiap soal yang ada di beberapa langkah praktikum ini.

>**Perhatian**: Diasumsikan Anda telah berhasil menyelesaikan Praktikum 1.

Pada codelab ini, kita akan menambah kode dari aplikasi **books** di praktikum sebelumnya.

### **Langkah 1: Buka file main.dart**
Tambahkan tiga method berisi kode seperti berikut di dalam `class _FuturePageState`.
```dart
Future<int> returnOneAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 1;
}

Future<int> returnTwoAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 2;
}

Future<int> returnThreeAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 3;
}
```

### **Langkah 2: Tambah method count()**
Lalu tambahkan lagi method ini di bawah ketiga method sebelumnya.
```dart
Future count() async {
  int total = 0;
  total = await returnOneAsync();
  total += await returnTwoAsync();
  total += await returnThreeAsync();
  setState(() {
    result = total.toString();
  });
}
```

### **Langkah 3: Panggil count()**
Lakukan comment kode sebelumnya, ubah isi kode onPressed() menjadi seperti berikut.
```dart
ElevatedButton(
   child: const Text('GO!'),
      onPressed: () {
          count();
      },
}
```

>**Penjelasan hasil:**
>- Saat tombol "GO!" ditekan, aplikasi mulai menghitung
>- Terjadi delay 9 detik (3 detik × 3 operasi async)
>- Setelah 9 detik, muncul angka "6" sebagai hasil penjumlahan 1 + 2 + 3
>- CircularProgressIndicator tetap berputar menunjukkan UI tetap responsif selama proses async

### **Langkah 4: Run**
Akhirnya, **run** atau tekan **F5** jika aplikasi belum running. Maka Anda akan melihat seperti gambar berikut, hasil angka 6 akan tampil setelah delay 9 detik.

![alt text](books/images/hasil_praktikum2_soal4.gif)

**Penjelasan hasil:**
- Saat tombol "GO!" ditekan, aplikasi mulai menghitung 
- Terjadi delay 9 detik (3 detik × 3 operasi async)
- Setelah 9 detik, muncul angka "6" sebagai hasil penjumlahan 1 + 2 + 3
- CircularProgressIndicator tetap berputar menunjukkan UI tetap responsif selama proses async

>#### **Soal 4**
>* Jelaskan maksud kode langkah 1 dan 2 tersebut!
>
>**Jawab:**
>
>**Penjelasan Langkah 1 (Method returnOneAsync, returnTwoAsync, returnThreeAsync):**
>
>Ketiga method ini adalah contoh **fungsi asynchronous** yang mengembalikan nilai Future<int>:
>
>1. **`Future<int>`**: Menandakan bahwa fungsi ini akan mengembalikan nilai integer di masa depan (tidak langsung/instant)
>
>2. **`async`**: Keyword yang menandai bahwa fungsi ini bersifat asynchronous, artinya dapat melakukan operasi yang membutuhkan waktu tanpa memblokir thread utama
>
>3. **`await Future.delayed(const Duration(seconds: 3))`**: 
>     - Menunda eksekusi selama 3 detik
>     - `await` membuat program menunggu hingga delay selesai sebelum melanjutkan ke baris berikutnya
>     - Simulasi operasi yang membutuhkan waktu (seperti request API, baca file, dll)
>
>4. **`return 1/2/3`**: Setelah delay 3 detik, masing-masing fungsi mengembalikan nilai 1, 2, dan 3
>
>**Penjelasan Langkah 2 (Method count):**
>
>Method `count()` adalah fungsi asynchronous yang memanggil ketiga fungsi di atas secara **berurutan** (sequential):
>
>1. **`Future<void> count() async`**: 
>     - Fungsi async yang tidak mengembalikan nilai (void)
>     - Digunakan untuk mengeksekusi operasi async dan update UI
>
>2. **`int total = 0`**: Inisialisasi variabel untuk menyimpan total
>
>3. **`total = await returnOneAsync()`**: 
>     - Menunggu 3 detik hingga `returnOneAsync()` selesai
>     - Mendapat nilai 1, lalu assign ke `total`
>     - Total sekarang = 1
>
>4. **`total += await returnTwoAsync()`**: 
>     - Menunggu 3 detik lagi hingga `returnTwoAsync()` selesai
>     - Mendapat nilai 2, lalu tambahkan ke `total`
>     - Total sekarang = 1 + 2 = 3
>
>5. **`total += await returnThreeAsync()`**: 
>     - Menunggu 3 detik lagi hingga `returnThreeAsync()` selesai
>     - Mendapat nilai 3, lalu tambahkan ke `total`
>     - Total sekarang = 3 + 3 = 6
>
>6. **`setState(() { result = total.toString(); })`**: 
>     - Update state untuk memperbarui UI
>     - Menampilkan hasil total (6) di layar
>
>**Total waktu eksekusi: 9 detik** (3 detik × 3 fungsi, karena dijalankan secara berurutan)
>
>**Keuntungan menggunakan async/await dibanding then():**
>
>a.  Kode lebih mudah dibaca (seperti kode synchronous biasa)
>
>b.  Lebih mudah di-maintain
>
>c.  Error handling lebih sederhana dengan try-catch
>
>d.  Menghindari "callback hell" atau "pyramid of doom"
> 
>* Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "**W11: Soal 4**".

## **Praktikum 3: Menggunakan Completer di Future**
Menggunakan Future dengan `then`, `catchError`, `async`, dan `await` mungkin sudah cukup untuk banyak kasus, tetapi ada alternatif melakukan operasi async di Dart dan Flutter yaitu dengan `class Completer`.

**Completer** membuat object Future yang mana Anda dapat menyelesaikannya nanti (late) dengan return sebuah value atau error.

Setelah Anda menyelesaikan praktikum 2, Anda dapat melanjutkan praktikum 3 ini. Selesaikan langkah-langkah praktikum berikut ini menggunakan editor Visual Studio Code (VS Code) atau Android Studio atau code editor lain kesukaan Anda. Jawablah di laporan praktikum Anda pada setiap soal yang ada di beberapa langkah praktikum ini.

>**Perhatian**: Diasumsikan Anda telah berhasil menyelesaikan Praktikum 2.

### **Langkah 1: Buka main.dart**
Pastikan telah impor package async berikut.
```dart
import 'package:async/async.dart';
```

### **Langkah 2: Tambahkan variabel dan method**
Tambahkan variabel late dan method di **class _FuturePageState** seperti ini.
```dart
late Completer completer;

Future getNumber() {
  completer = Completer<int>();
  calculate();
  return completer.future;
}

Future calculate() async {
  await Future.delayed(const Duration(seconds : 5));
  completer.complete(42);
}
```

### **Langkah 3: Ganti isi kode onPressed()**
Tambahkan kode berikut pada fungsi **onPressed()**. Kode sebelumnya bisa Anda comment.
```dart
getNumber().then((value) {
                setState(() {
                  result = value.toStrin();
                });
              });
```
### **Langkah 4:**
Terakhir, **run** atau tekan **F5** untuk melihat hasilnya jika memang belum running. Bisa juga lakukan **hot restart** jika aplikasi sudah running. Maka hasilnya akan seperti gambar berikut ini. Setelah 5 detik, maka angka 42 akan tampil.

![alt text](books/images/hasil_praktikum3_soal5.gif)

>#### **Soal 5**
>* Jelaskan maksud kode langkah 2 tersebut!
>
>**Jawab:**
>
>**Penjelasan Kode Langkah 2:**
>
>**1. Variabel `late Completer completer;`**
>- `late` adalah modifier yang menandakan variabel akan diinisialisasi nanti (bukan saat deklarasi)
>- `Completer` adalah class yang digunakan untuk membuat dan mengontrol Future secara manual
>- Berbeda dengan Future biasa yang langsung dieksekusi, Completer memberi kontrol penuh kapan Future selesai
>
>**2. Method `getNumber()`**
>```dart
>Future getNumber() {
>  completer = Completer<int>();     // ← Membuat instance Completer bertipe int
>  calculate();                       // ← Memanggil fungsi calculate
>  return completer.future;           // ← Mengembalikan Future dari Completer
>}
>```
>- **`completer = Completer<int>()`**: Membuat objek Completer yang akan menghasilkan Future bertipe integer
>- **`calculate()`**: Memanggil fungsi asynchronous yang akan menyelesaikan Completer
>- **`return completer.future`**: Mengembalikan Future yang terkait dengan Completer ini, Future ini akan selesai ketika `completer.complete()` dipanggil
>
>**3. Method `calculate()`**
>```dart
>Future calculate() async {
>  await Future.delayed(const Duration(seconds: 5));  // ← Delay 5 detik
>  completer.complete(42);                            // ← Selesaikan dengan nilai 42
>}
>```
>- **`await Future.delayed(const Duration(seconds: 5))`**: Menunggu selama 5 detik (simulasi operasi yang memakan waktu)
>- **`completer.complete(42)`**: Menyelesaikan Future dengan nilai 42
>  - Setelah baris ini dijalankan, semua listener `.then()` yang menunggu Future ini akan dieksekusi
>  - Nilai 42 akan dikirim ke callback `.then()`
>
>**Keuntungan Menggunakan Completer:**
>
>a. **Kontrol manual**: Kita bisa menentukan kapan Future selesai
>
>b. **Fleksibilitas**: Bisa complete dari berbagai tempat dalam kode
>
>c. **Pemisahan concern**: Logika pembuatan Future terpisah dari logika completion
>
>d.  **Use case**: Berguna untuk membungkus callback-based API menjadi Future-based
>
>* Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "**W11: Soal 5**".