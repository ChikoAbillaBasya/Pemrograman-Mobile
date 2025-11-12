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

## **Praktikum 2: Stream controllers dan sinks**
`StreamControllers` akan membuat jembatan antara `Stream` dan `Sink`. `Stream` berisi data secara sekuensial yang dapat diterima oleh subscriber manapun, sedangkan `Sink` digunakan untuk mengisi (injeksi) data.

Secara sederhana, StreamControllers merupakan stream management. Ia akan otomatis membuat stream dan sink serta beberapa method untuk melakukan kontrol terhadap event dan fitur-fitur yang ada di dalamnya.

Anda dapat membayangkan stream sebagai pipa air yang mengalir searah, dari salah satu ujung Anda dapat mengisi data dan dari ujung lain data itu keluar. Anda dapat melihat konsep stream pada gambar diagram berikut ini.

![alt text](img/stream_controller.png)

Di Flutter, Anda dapat menggunakan `StreamController` untuk mengontrol aliran data `stream`. Sebuah `StreamController` memiliki sebuah properti bernama `sink` yang berguna untuk insert data. Sedangkan properti `stream` berguna untuk menerima atau keluarnya data dari `StreamController` tersebut.

Setelah Anda menyelesaikan praktikum 1, Anda dapat melanjutkan praktikum 2 ini. Selesaikan langkah-langkah praktikum berikut ini menggunakan editor Visual Studio Code (VS Code) atau Android Studio atau code editor lain kesukaan Anda. Jawablah di laporan praktikum Anda pada setiap soal yang ada di beberapa langkah praktikum ini.

>**Perhatian**: Diasumsikan Anda telah berhasil menyelesaikan Praktikum 1.

Pada codelab ini, kita akan menambah kode dari aplikasi **stream** di praktikum sebelumnya.

### **Langkah 1: Buka file stream.dart**
Lakukan impor dengan mengetik kode ini.
```dart
import 'dart:async';
```

### **Langkah 2: Tambah class NumberStream**
Tetap di file stream.dart tambah class baru seperti berikut.
```dart
class NumberStream {
}
```

### **Langkah 3: Tambah StreamController**
Di dalam `class NumberStream` buatlah variabel seperti berikut.
```dart
final StreamController<int> controller = StreamController<int>();
```

### **Langkah 4: Tambah method addNumberToSink**
Tetap di `class NumberStream` buatlah method ini
```dart
void addNumberToSink(int newNumber) {
  controller.sink.add(newNumber);
}
```

### **Langkah 5: Tambah method close()**
```dart
close() {
  controller.close();
}
```

### **Langkah 6: Buka main.dart**
Ketik kode import seperti berikut
```dart
import 'dart:async';
import 'dart:math';
```

### **Langkah 7: Tambah variabel**
Di dalam `class _StreamHomePageState` ketik variabel berikut
```dart
int lastNumber = 0;
late StreamController numberStreamController;
late NumberStream numberStream;
```

### **Langkah 8: Edit initState()**
```dart
@override
void initState() {
  numberStream = NumberStream();
  numberStreamController = numberStream.controller;
  Stream stream = numberStreamController.stream;
  stream.listen((event) {
    setState(() {
      lastNumber = event;
    });
  });
  super.initState();
}
```

### **Langkah 9: Edit dispose()**
```dart
@override
void dispose() {
  numberStreamController.close();
  super.dispose();
}
```

### **Langkah 10: Tambah method addRandomNumber()**
```dart
void addRandomNumber() {
  Random random = Random();
  int myNum = random.nextInt(10);
  numberStream.addNumberToSink(myNum);
}
```

### **Langkah 11: Edit method build()**
```dart
body: SizedBox(
  width: double.infinity,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(lastNumber.toString()),
      ElevatedButton(
        onPressed: () => addRandomNumber(),
        child: Text('New Random Number'),
      )
    ],
  ),
)
```

### **Langkah 12: Run**
Lakukan running pada aplikasi Flutter Anda, maka akan terlihat seperti gambar berikut.

![alt text](<img/hasil_praktikum2_Soal 6.gif>)

>#### **Soal 6**
>* Jelaskan maksud kode langkah 8 dan 10 tersebut!
>
>**Jawab:**
>
>#### **Penjelasan Langkah 8 (initState):**
>
>```dart
>@override
>void initState() {
>  numberStream = NumberStream();              // 1
>  numberStreamController = numberStream.controller;  // 2
>  Stream stream = numberStreamController.stream;     // 3
>  stream.listen((event) {                     // 4
>    setState(() {                             // 5
>      lastNumber = event;
>    });
>  });
>  super.initState();
>}
>```
>
>**Penjelasan baris per baris:**
>
>1. **`numberStream = NumberStream()`**
>   - Membuat instance baru dari class `NumberStream`
>   - Instance ini akan membuat `StreamController<int>` baru di dalamnya
>
>2. **`numberStreamController = numberStream.controller`**
>   - Mengambil reference ke `StreamController` dari object `NumberStream`
>   - Controller ini digunakan untuk mengontrol stream (close, add data, dll)
>
>3. **`Stream stream = numberStreamController.stream`**
>   - Mengambil stream dari controller
>   - Stream ini yang akan mengirimkan/emit data ke listener
>
>4. **`stream.listen((event) { ... })`**
>   - **Subscribe/listen** ke stream untuk mendengarkan data yang masuk
>   - Setiap ada data baru masuk ke stream, callback akan dipanggil
>   - Parameter `event` berisi data integer yang dikirim melalui stream
>
>5. **`setState(() { lastNumber = event; })`**
>   - Update state dengan nilai terbaru dari stream
>   - `setState()` akan trigger rebuild UI
>   - Variabel `lastNumber` diupdate dengan nilai dari `event`
>   - UI akan menampilkan angka terbaru
>
>---
>
>#### **Penjelasan Langkah 10 (addRandomNumber):**
>
>```dart
>void addRandomNumber() {
>  Random random = Random();              // 1
>  int myNum = random.nextInt(10);       // 2
>  numberStream.addNumberToSink(myNum);  // 3
>}
>```
>
>**Penjelasan baris per baris:**
>
>1. **`Random random = Random()`**
>   - Membuat instance dari class `Random` (dari `dart:math`)
>   - Digunakan untuk generate angka random
>
>2. **`int myNum = random.nextInt(10)`**
>   - Generate angka random integer antara **0-9**
>   - `nextInt(10)` artinya: 0 (inclusive) sampai 10 (exclusive)
>   - Hasil disimpan di variabel `myNum`
>
>3. **`numberStream.addNumberToSink(myNum)`**
>   - Memanggil method `addNumberToSink()` dari class `NumberStream`
>   - Method ini akan mengirim angka ke **sink** dari stream
>   - Sink adalah "pintu masuk" untuk memasukkan data ke stream
>   - Data yang masuk ke sink akan otomatis keluar melalui stream
>   - Listener yang sudah di-setup di `initState()` akan menangkap data ini
>
>---
>
>* Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
>* Lalu lakukan commit dengan pesan **"W12: Jawaban Soal 6"**.