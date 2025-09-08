<div align="center">

# LAPORAN PRAKTIKUM  
## PEMROGRAMAN MOBILE  

<img src="https://3.bp.blogspot.com/-whSxEvHuEds/VOBUC7I5NNI/AAAAAAAAAUY/qfk23ch5o_c/s1600/logo_polinema_by_adminkerapolinema-d3b0ojd.jpg" alt="Logo Polinema" width="140"/>

---

## JOBSHEET 01  
### Pengantar Bahasa Pemrograman Dart - Bagian 1

---

### Dosen Pengampu:  
Habibie Ed Dien, S.Kom., M.T.

---

### Disusun oleh:  
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

## Tugas Praktikum

### 1. Modifikasi Kode
> Modifikasilah kode pada baris 3 di VS Code atau Editor Code favorit Anda berikut ini agar mendapatkan keluaran (output) sesuai yang diminta!

**Kode Sebelum Dimodifikasi:**

![alt text](<img/Screenshot 2025-09-01 202212.png>)

**Kode Setelah Dimodifikasi:**

![alt text](<img/Screenshot 2025-09-01 220034.png>)

**Output yang Diminta:**

![alt text](<img/Screenshot 2025-09-01 220043.png>)

---

### 2. Pentingnya Memahami Dart Sebelum Flutter
> Mengapa sangat penting untuk memahami bahasa pemrograman Dart sebelum kita menggunakan framework Flutter? Jelaskan!

Memahami bahasa pemrograman **Dart** sangat penting sebelum menggunakan **Flutter** karena:
- Flutter dibangun menggunakan Dart.
- Memudahkan penulisan kode yang efisien dan mudah di-debug.
- Memahami konsep dasar seperti tipe data, fungsi, dan OOP.
- Membantu memahami dokumentasi dan komunitas Flutter yang mayoritas menggunakan Dart.

---

### 3. Rangkuman Materi Codelab
> Rangkumlah materi dari codelab ini menjadi poin-poin penting yang dapat Anda gunakan untuk membantu proses pengembangan aplikasi mobile menggunakan framework Flutter.

**Poin-poin Penting:**
1. Bahasa inti Flutter adalah **Dart** (semua aplikasi, plugin, dan dependensi ditulis dalam Dart).
2. Kelebihan Dart sebagai bahasa modern:
   - Productive tooling (analisis kode, plugin IDE, ekosistem paket luas).
   - Garbage collection otomatis.
   - Type annotations (opsional) & type inference.
   - Statically typed dengan type safety.
   - Portability (bisa dikompilasi ke JavaScript atau native ARM/x86).
3. Sejarah Dart:
   - Rilis 2011 (awal fokus web).
   - 2013 versi stabil.
   - 2018 rilis Dart 2 (fokus mobile & Flutter).
   - Dirancang lebih tangguh dibanding JavaScript.
4. Eksekusi kode Dart:
   - JIT (Just-In-Time): cocok untuk development, mendukung debugging & hot reload.
   - AOT (Ahead-Of-Time): cocok untuk produksi, performa tinggi.
5. Hot reload Flutter bekerja berkat kompiler JIT milik Dart.
6. Struktur bahasa Dart:
   - Menggunakan function `main()` sebagai entry point.
   - Sintaks mirip bahasa C/JavaScript.
   - Object-oriented (encapsulation, inheritance, abstraction, polymorphism).
7. Operator di Dart:
   - Arithmetic (+, -, *, /, %, dll).
   - Increment/decrement (++, --).
   - Equality & relational (==, !=, <, <=, >=).
   - Logical (!, &&, ||).
8. DartPad: tool online untuk belajar dan eksperimen kode Dart.
9. Function vs Method:
   - Function: berada di luar class (contoh: `main`).
   - Method: terikat pada sebuah class.

---

### 4. Null Safety vs Late Variable
> Buatlah penjelasan dan contoh eksekusi kode tentang perbedaan Null Safety dan Late variabel!

#### A. Null Safety
Null Safety adalah fitur penting dalam Dart yang memastikan setiap variabel memiliki nilai yang valid, sehingga mencegah error null reference exception. Jika ingin variabel bisa bernilai null, tambahkan tanda tanya (?) setelah tipe data, misal: `String? alamat`.

**Contoh Kode:**

![alt text](<img/Screenshot 2025-09-01 215400.png>)

**Output:**

![alt text](<img/Screenshot 2025-09-01 215416.png>)

#### B. Late Variable
`late` digunakan untuk menunda inisialisasi variabel non-nullable hingga saat variabel benar-benar dipakai. Cocok untuk variabel yang nilainya baru diketahui setelah proses tertentu. Jika variabel late dipanggil sebelum diberi nilai, akan terjadi error.

**Contoh Kode:**

![alt text](<img/Screenshot 2025-09-01 221520.png>)

**Output:**

![alt text](<img/Screenshot 2025-09-01 221527.png>)