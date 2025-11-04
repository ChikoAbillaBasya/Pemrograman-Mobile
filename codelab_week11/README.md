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

#### **Langkah 5: Tambah kode di ElevatedButton**
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