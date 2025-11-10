<div align="center">

# LAPORAN PRAKTIKUM

## PEMROGRAMAN MOBILE

<img src="https://3.bp.blogspot.com/-whSxEvHuEds/VOBUC7I5NNI/AAAAAAAAAUY/qfk23ch5o_c/s1600/logo_polinema_by_adminkerapolinema-d3b0ojd.jpg" alt="Logo Polinema" width="140"/>

---

## JOBSHEET 10

### Streams

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

## **Praktikum 1: Dart Streams**
Selesaikan langkah-langkah praktikum berikut ini menggunakan editor Visual Studio Code (VS Code) atau Android Studio atau code editor lain kesukaan Anda. Jawablah di laporan praktikum Anda (ketik di **README.md**) pada setiap soal yang ada di beberapa langkah praktikum ini.

>**Perhatian**: Diasumsikan Anda telah berhasil melakukan setup environment Flutter SDK, VS Code, Flutter Plugin, dan Android SDK pada pertemuan pertama.

### **Langkah 1: Buat Project Baru**
Buatlah sebuah project flutter baru dengan nama **stream_nama** (beri nama panggilan Anda) di folder **week-12/src/** repository GitHub Anda.

![alt text](img/new_stream.png)

### **Langkah 2: Buka file main.dart**
Ketiklah kode seperti berikut ini.
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream - Chiko',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

>#### **Soal 1**
>* Tambahkan **nama panggilan Anda** pada `title` app sebagai identitas hasil pekerjaan Anda.
>* Gantilah warna tema aplikasi sesuai kesukaan Anda.
>* Lakukan commit hasil jawaban Soal 1 dengan pesan **"W12: Jawaban Soal 1"**

### **Langkah 3: Buat file baru stream.dart**
Buat file baru di folder lib project Anda. Lalu isi dengan kode berikut.
```dart
import 'package:flutter/material.dart';

class ColorStream {

}
```

### **Langkah 4: Tambah variabel colors**
Tambahkan variabel di dalam class `ColorStream` seperti berikut.
```dart
final List<Color> colors = [
  Colors.red,
  Colors.green,
  Colors.pink,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
];
```

>#### **Soal 2**
>* Tambahkan 5 warna lainnya sesuai keinginan Anda pada variabel `colors` tersebut.
>* Lakukan commit hasil jawaban Soal 2 dengan pesan **"W12: Jawaban Soal 2"**

### **Langkah 5: Tambah method getColors()**
Di dalam `class ColorStream` ketik method seperti kode berikut. Perhatikan tanda bintang di akhir keyword `async*` (ini digunakan untuk melakukan `Stream` data)
```dart
Stream<Color> getColors() async* {

}
```

### **Langkah 6: Tambah perintah yield***
Tambahkan kode berikut ini.
```dart
yield* Stream.periodic(
  const Duration(seconds: 1), (int t) {
    int index = t % colors.length;
    return colors[index];
});
```

>#### **Soal 3**
>* Jelaskan fungsi keyword `yield*` pada kode tersebut!
>
>**Jawab:**
>
>Fungsi keyword `yield*` digunakan untuk mengembalikan (yield) **seluruh nilai dari Stream lain** ke dalam Stream yang sedang dibuat. Berbeda dengan `yield` yang mengembalikan satu nilai, `yield*` mengembalikan semua nilai dari Stream secara berurutan.
>
>* Apa maksud isi perintah kode tersebut?
>
>**Jawab:**
>
>1. Stream.periodic → Membuat stream yang mengirimkan data secara berkala/periodik
>2. Duration(seconds: 1) → Interval waktu 1 detik untuk setiap emission
>3. (int t) → Parameter t adalah counter yang dimulai dari 0 dan bertambah setiap interval
>4. t % colors.length → Operasi modulo untuk mendapatkan index yang berputar (0 sampai panjang colors - 1)
>5. return colors[index] → Mengembalikan warna pada index tersebut
>
>* Lakukan commit hasil jawaban Soal 3 dengan pesan **"W12: Jawaban Soal 3"**