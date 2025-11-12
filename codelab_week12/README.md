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

### **Langkah 7: Buka main.dart**
Ketik kode impor file ini pada file `main.dart`
```dart
import 'stream.dart';
```

### **Langkah 8: Tambah variabel**
Ketik dua properti ini di dalam `class _StreamHomePageState`
```dart
Color bgColor = Color.blueGrey;
late ColorStream colorStream;
```

### **Langkah 9: Tambah method changeColor()**
Tetap di file main, Ketik kode seperti berikut
```dart
void changeColor() async {
  await for (var eventColor in colorStream.getColors()) {
    setState(() {
      bgColor = eventColor;
    });
  }
}
```

### **Langkah 10: Lakukan override initState()**
Ketika kode seperti berikut
```dart
@override
void initState() {
  super.initState();
  colorStream = ColorStream();
  changeColor();
}
```

### **Langkah 11: Ubah isi Scaffold()**
Sesuaikan kode seperti berikut.
```dart
return Scaffold(
  appBar: AppBar(
    title: const Text('Stream'),
  ),
  body: Container(
    decoration: BoxDecoration(color: bgColor),
  ));
}
```

### **Langkah 12: Run**
Lakukan running pada aplikasi Flutter Anda, maka akan terlihat berubah warna background setiap detik.

![alt text](<img/hasil_praktikum1_Soal 4.gif>)

>#### **Soal 4**
>* Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
>* Lakukan commit hasil jawaban Soal 4 dengan pesan **"W12: Jawaban Soal 4"**

### **Langkah 13: Ganti isi method changeColor()**
Anda boleh comment atau hapus kode sebelumnya, lalu ketika kode seperti berikut.
```dart
colorStream.getColors().listen((eventColor) {
  setState(() {
    bgColor = eventColor;
  });
});
```

>#### **Soal 5**
>* Jelaskan perbedaan menggunakan `listen` dan `await for` (langkah 9) !
>
>**Jawab:**
>
>#### **Perbedaan `listen()` dan `await for`:**
>
>| Aspek | `await for` | `listen()` |
>|-------|-------------|------------|
>| **Sifat** | Synchronous & Blocking | Asynchronous & Non-blocking |
>| **Eksekusi** | Menunggu setiap item secara berurutan | Mendengarkan tanpa memblokir kode lain |
>| **Kontrol** | Lebih sederhana, linear | Lebih fleksibel dengan callback |
>| **Use Case** | Ketika perlu proses sequential | Ketika perlu proses parallel/reactive |
>| **Error Handling** | Menggunakan try-catch | Menggunakan `onError` parameter |
>| **Pembatalan** | Sulit dibatalkan | Mudah dibatalkan dengan `subscription.cancel()` |
>
>#### **1. `await for` (Langkah 9):**
>```dart
>void changeColor() async {
>  await for (var eventColor in colorStream.getColors()) {
>    setState(() {
>      bgColor = eventColor;
>    });
>  }
>}
>```
>
>**Karakteristik:**
>- **Blocking**: Kode menunggu setiap event dari stream
>- **Sequential**: Memproses satu per satu secara berurutan
>- **Simple**: Sintaks lebih sederhana seperti for loop biasa
>- **Sulit cancel**: Tidak mudah untuk membatalkan subscription
>- **Error handling**: Menggunakan try-catch
>
>#### **2. `listen()` (Langkah 13):**
>```dart
>void changeColor() {
>  colorStream.getColors().listen((eventColor) {
>    setState(() {
>      bgColor = eventColor;
>    });
>  });
>}
>```
>
>**Karakteristik:**
>- **Non-blocking**: Kode tidak menunggu, langsung lanjut
>- **Reactive**: Bereaksi saat ada data baru
>- **Flexible**: Bisa tambahkan `onError`, `onDone`, `cancelOnError`
>- **Controllable**: Bisa di-cancel dengan `subscription.cancel()`
>- **Better error handling**: Mendukung callback untuk error
>
>#### **Contoh dengan Error Handling:**
>```dart
>void changeColor() {
>  colorStream.getColors().listen(
>    (eventColor) {
>      setState(() {
>        bgColor = eventColor;
>      });
>    },
>    onError: (error) {
>      print('Error occurred: $error');
>    },
>    onDone: () {
>      print('Stream completed');
>    },
>  );
>}
>```
>
>#### **Kesimpulan:**
>a. **Gunakan `await for`** ketika perlu proses sequential/berurutan dan kode lebih sederhana
>
>b.  **Gunakan `listen()`** ketika perlu proses non-blocking, kontrol penuh (cancel, error handling), dan aplikasi reactive
>
>c. **`listen()` lebih cocok untuk aplikasi Flutter** karena tidak memblokir UI thread
>
>* Lakukan commit hasil jawaban Soal 5 dengan pesan **"W12: Jawaban Soal 5"**

>**Catatan**: Stream di Flutter memiliki fitur yang powerfull untuk menangani data secara async. Stream dapat dimanfaatkan pada skenario dunia nyata seperti real-time messaging, unggah dan unduh file, tracking lokasi user, bekerja dengan data sensor IoT, dan lain sebagainya.