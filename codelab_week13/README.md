<div align="center">

# LAPORAN PRAKTIKUM

## PEMROGRAMAN MOBILE

<img src="https://3.bp.blogspot.com/-whSxEvHuEds/VOBUC7I5NNI/AAAAAAAAAUY/qfk23ch5o_c/s1600/logo_polinema_by_adminkerapolinema-d3b0ojd.jpg" alt="Logo Polinema" width="140"/>

---

## JOBSHEET 11

### Persistensi Data

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

## **Praktikum 1: Konversi Dart model ke JSON**
Selesaikan langkah-langkah praktikum berikut ini menggunakan editor Visual Studio Code (VS Code) atau Android Studio atau code editor lain kesukaan Anda. Jawablah di laporan praktikum Anda (ketik di **README.md**) pada setiap soal yang ada di beberapa langkah praktikum ini.

>**Perhatian**: Diasumsikan Anda telah berhasil melakukan setup environment Flutter SDK, VS Code, Flutter Plugin, dan Android SDK pada pertemuan pertama.

### **Langkah 1: Buat Project Baru**
Buatlah sebuah project flutter baru dengan nama **store_data_nama** (beri nama panggilan Anda) di folder **week-13/src/** repository GitHub Anda.

![alt text](img/new_store_data.png)

### **Langkah 2: Buka file main.dart**
Ketiklah kode seperti berikut ini.
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo - Chiko',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON - Chiko')),
      body: Container(),
    );
  }
}
```

>#### **Soal 1**
>* Tambahkan **nama panggilan** Anda pada **title** app sebagai identitas hasil pekerjaan Anda.
>* Gantilah warna tema aplikasi sesuai kesukaan Anda.
>* Lakukan commit hasil jawaban Soal 1 dengan pesan **"W13: Jawaban Soal 1"**

### **Langkah 3: Buat folder baru assets**
Buat folder baru `assets` di root project Anda

### **Langkah 4: Buat file baru pizzalist.json**
Letakkan file ini di dalam folder `assets`, lalu salin data JSON berikut ke file tersebut.
```dart
[ 
    { 
      "id": 1, 
      "pizzaName": "Margherita", 
      "description": "Pizza with tomato, fresh mozzarella and basil",
      "price": 8.75, 
      "imageUrl": "images/margherita.png" 
    }, 
    { 
      "id": 2, 
      "pizzaName": "Marinara", 
      "description": "Pizza with tomato, garlic and oregano",
      "price": 7.50, 
      "imageUrl": "images/marinara.png"  
    }, 
    { 
      "id": 3, 
      "pizzaName": "Napoli", 
      "description": "Pizza with tomato, garlic and anchovies",
      "price": 9.50, 
      "imageUrl": "images/marinara.png"  
    }, 
    { 
      "id": 4, 
      "pizzaName": "Carciofi", 
      "description": "Pizza with tomato, fresh mozzarella and artichokes",
      "price": 8.80, 
      "imageUrl": "images/marinara.png"  
    }, 
    { 
      "id": 5, 
      "pizzaName": "Bufala", 
      "description": "Pizza with tomato, buffalo mozzarella and basil",
      "price": 12.50, 
      "imageUrl": "images/marinara.png"  
    }
]
```
Jika Anda ingin menggunakan data JSON yang lain, Anda dapat mengakses salah satu dari daftar API di tautan ini: https://github.com/public-apis/public-apis 

### **Langkah 5: Edit pubspec.yaml**
Tambahkan referensi folder `assets` ke file pubspec.yaml seperti berikut ini.
```
assets:
  - assets/
```

### **Langkah 6: Edit maint.dart**
Buatlah variabel seperti berikut ini class `_MyHomePageState`.
```dart
String pizzaString = '';
```

### **Langkah 7: Tetap di main.dart**
Untuk membaca isi dari file `pizzalist.json` di dalam class _MyHomePageState, tambahkan method `readJsonFile` seperti kode berikut untuk membaca file json.
```dart
Future readJsonFile() async {
  String myString = await DefaultAssetBundle.of(context)
      .loadString('assets/pizzalist.json');
  setState(() {
    pizzaString = myString;
  });
}
```

### **Langkah 8: Panggil method readJsonFile**
Panggil method `readJsonFile` di initState
```dart
@override
void initState() {
  super.initState();
  readJsonFile();
}
```

### **Langkah 9: Tampilkan hasil JSON**
Kemudian tampilkan hasil JSON di body scaffold.
```dart
body: Text(pizzaString),
```

### **Langkah 10: Run**
Jika kode sudah benar, seharusnya tampil seperti gambar berikut ini.

![alt text](<img/hasil_praktikum1_Soal 2.png>)

>#### **Soal 2**
>* Masukkan hasil capture layar ke laporan praktikum Anda.
>* Lakukan commit hasil jawaban Soal 2 dengan pesan **"W13: Jawaban Soal 2"**

### **Langkah 11: Buat file baru pizza.dart**
Kita ingin mengubah data json tersebut dari String menjadi objek List. Maka perlu membuat file class baru di folder `lib/model` dengan nama file `pizza.dart`.

### **Langkah 12: Model pizza.dart**
Ketik kode berikut pada file `pizza.dart`
```dart
class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;
}
```

### **Langkah 13: Buat constructor()**
Di dalam class `Pizza` definisikan constructor `fromJson`, yang mana akan mengambil data berupa Map sebagai parameter dan mengubah Map ke objek Pizza seperti kode berikut:
```dart
Pizza.fromJson(Map<String, dynamic> json) :
  id = json['id'],
  pizzaName = json['pizzaName'],
  description = json['description'],
  price = json['price'],
  imageUrl = json['imageUrl'];
```

### **Langkah 14: Pindah ke class _MyHomePageState**
Tambahkan kode jsonDecode seperti berikut.
```dart
Future readJsonnFile() async {
  String myString = await DefaultAssetBundle.of(context)
      .loadString('assets/pizzalist.json');
  List pizzaMapList = jsonDecode(myString);
  ...
}
```

### **Langkah 15: Pastikan impor class**
Perhatikan pada bagian atas file bahwa telah berhasil impor kedua file berikut.
```dart
import 'dart:convert';
import './pizza.dart';
```

Anda telah berhasil mengimpor pustaka yang diperlukan dan melakukan decoding string JSON menjadi List pizzaMapList pada Langkah ini. Selanjutnya, kita akan mengonversi List Map tersebut menjadi List objek Dart (List<Pizza>).

### **Langkah 16: Konversi List Map ke List Objek Dart**
Di dalam method readJsonFile(), setelah baris List pizzaMapList = jsonDecode(myString);, tambahkan kode berikut untuk mengonversi setiap Map di pizzaMapList menjadi objek Pizza dan menyimpannya ke myPizzas.
```dart
List<Pizza> myPizzas = [];
for (var pizza in pizzaMapList) {
  Pizza myPizza = Pizza.fromJson(pizza);
  myPizzas.add(myPizza);
}
```

### **Langkah 17: return myPizzas**
Hapus atau komentari `setState` yang menampilkan `pizzaString` dari Langkah 7. Kemudian, kembalikan `myPizzas`.
```dart
return myPizzas;
```

### **Langkah 18: Perbarui Signature Method**
Perbarui signature method `readJsonFile()` untuk secara eksplisit menunjukkan bahwa ia mengembalikan `Future` yang berisi `List`.
```dart
Future<List<Pizza>> readJsonFile() async {
```

### **Langkah 19: Deklarasikan Variabel State**
Di dalam `class _MyHomePageState`, deklarasikan variabel state baru untuk menampung List objek Pizza.
```dart
List<Pizza> myPizzas = [];
```

### **Langkah 20: Panggil di initState dan Perbarui State**
Perbarui method `initState()` di `_MyHomePageState` untuk memanggil `readJsonFile()`. Karena `readJsonFile()` mengembalikan `Future`, gunakan `.then()` untuk mendapatkan hasilnya, dan perbarui state `myPizzas`.
```dart
@override
void initState() {
  super.initState();
  readJsonFile().then((value) {
    setState(() {
      myPizzas = value;
    });
  });
}
```

### **Langkah 21: Tampilkan Data di ListView**
Perbarui body dari Scaffold untuk menggunakan ListView.builder yang menampilkan pizzaName sebagai judul dan description sebagai subjudul dari setiap objek Pizza.
```dart
body: ListView.builder(
  itemCount: myPizzas.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(myPizzas[index].pizzaName),
      subtitle: Text(myPizzas[index].description),
    );
  },
 ));
}
```

### **Langkah 22: Run**
Jalankan aplikasi. Sekarang, Anda akan melihat data pizza ditampilkan dalam daftar yang lebih terstruktur sebagai objek List Dart.

![alt text](<img/hasil_praktikum1_Soal 3.png>)

>### **Soal 3**
>* Masukkan hasil capture layar ke laporan praktikum Anda.
>* Lakukan commit hasil jawaban Soal 2 dengan pesan **"W13: Jawaban Soal 3"**