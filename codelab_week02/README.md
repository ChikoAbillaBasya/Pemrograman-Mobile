<div align="center">

# LAPORAN PRAKTIKUM  
## PEMROGRAMAN MOBILE  

<img src="https://3.bp.blogspot.com/-whSxEvHuEds/VOBUC7I5NNI/AAAAAAAAAUY/qfk23ch5o_c/s1600/logo_polinema_by_adminkerapolinema-d3b0ojd.jpg" alt="Logo Polinema" width="140"/>

---

## JOBSHEET 02  
### Pengantar Bahasa Pemrograman Dart - Bagian 2  

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

## Praktikum 1: Menerapkan Control Flows ("if/else")

Selesaikan langkah-langkah praktikum berikut ini menggunakan DartPad di browser Anda.

### Langkah 1
Ketik atau salin kode program berikut ke dalam fungsi `main()`.

**Kode Program**  
![Kode Program Praktikum 1 Langkah 1](img/Kode_P1_langkah1.png)

### Langkah 2
Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan!

**Output**  
![Output Praktikum 1 Langkah 1](img/Output_P1_langkah1.png)

> Karena variabel test bernilai "test2", maka kondisi pertama `if (test == "test1")` bernilai false sehingga tidak dijalankan. Kondisi kedua `else if (test == "test2")` bernilai true, sehingga program mengeksekusi perintah mencetak "Test2". Selanjutnya, pada pernyataan terakhir `if (test == "test2") print("Test2 again");`, kondisi kembali bernilai true, sehingga program juga mencetak "Test2 again".

### Langkah 3
Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

**Kode Program**  
![Kode Program Praktikum 1 Langkah 3](img/Kode_P1_langkah3.png)

**Output**  
![Output Praktikum 1 Langkah 3](img/Output_P1_langkah3.png)

---

## Praktikum 2: Menerapkan Perulangan "while" dan "do-while"

Selesaikan langkah-langkah praktikum berikut ini menggunakan DartPad di browser Anda.

### Langkah 1
Ketik atau salin kode program berikut ke dalam fungsi `main()`.

**Kode Program**  
![Kode Program Praktikum 2 Langkah 1](img/Kode_P2_langkah1.png)

### Langkah 2
Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

**Output**  
![Output Praktikum 2 Langkah 1](img/Output_P2_langkah1.png)

> Variabel counter diawali dengan nilai 0. Selama nilai counter masih lebih kecil dari 33, perulangan while akan terus dijalankan. Pada setiap putaran, nilai counter dicetak ke layar lalu ditambah satu. Ketika nilai counter mencapai 33, kondisi `while (counter < 33)` menjadi salah, sehingga perulangan berhenti.

### Langkah 3
Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

**Kode Program**  
![Kode Program Praktikum 2 Langkah 3](img/Kode_P2_langkah3.png)

Apa yang terjadi? Jika terjadi error, silakan perbaiki namun tetap menggunakan do-while.

**Output**  
![Output Praktikum 2 Langkah 3.1](img/Output_P2_langkah3.1.png) ![Output Praktikum 2 Langkah 3.2](img/Output_P2_langkah3.2.png) ![Output Praktikum 2 Langkah 3.3](img/Output_P2_langkah3.3.png)

---

## Praktikum 3: Menerapkan Perulangan "for" dan "break-continue"

Selesaikan langkah-langkah praktikum berikut ini menggunakan DartPad di browser Anda.

### Langkah 1
Ketik atau salin kode program berikut ke dalam fungsi `main()`.

**Kode Program**  
![Kode Program Praktikum 3 Langkah 1](img/Kode_P3_langkah1.png)

### Langkah 2
Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

**Output**  
![Output Praktikum 3 Langkah 1](img/Output_P3_langkah1.png)

> Variabel index dimulai dengan nilai 10. Selama nilai index masih kurang dari 27, perulangan akan terus dijalankan. Pada setiap putaran, nilai index dicetak ke layar kemudian ditambah satu. Perulangan akan berhenti ketika nilai index mencapai 27.

### Langkah 3
Tambahkan kode program berikut di dalam for-loop, lalu coba eksekusi (Run) kode Anda.

**Kode Program**  
![Kode Program Praktikum 3 Langkah 3](img/Kode_P3_langkah3.png)

Apa yang terjadi? Jika terjadi error, silakan perbaiki namun tetap menggunakan for dan break-continue.

**Output**  
![Output Praktikum 3 Langkah 3](img/Output_P3_langkah3.png)

---

## Tugas Praktikum

1. **Silakan selesaikan Praktikum 1 sampai 3, lalu dokumentasikan berupa screenshot hasil pekerjaan beserta penjelasannya!**

2. **Buatlah sebuah program yang dapat menampilkan bilangan prima dari angka 0 sampai 201 menggunakan Dart. Ketika bilangan prima ditemukan, maka tampilkan nama lengkap dan NIM Anda.**

   **Kode Program**  
   ![Kode Program Tugas](img/Kode_Tugas.png)

   **Output**  
   ![Output Tugas 1](img/Output_Tugas1.png) ![Output Tugas 2](img/Output_Tugas2.png) 

3. **Kumpulkan berupa link commit repo GitHub pada tautan yang telah disediakan di grup Telegram!**