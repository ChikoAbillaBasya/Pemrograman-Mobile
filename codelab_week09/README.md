<div align="center">

# LAPORAN PRAKTIKUM

## PEMROGRAMAN MOBILE

<img src="https://3.bp.blogspot.com/-whSxEvHuEds/VOBUC7I5NNI/AAAAAAAAAUY/qfk23ch5o_c/s1600/logo_polinema_by_adminkerapolinema-d3b0ojd.jpg" alt="Logo Polinema" width="140"/>

---

## JOBSHEET 07

### Kamera

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

## **Praktikum 1: Mengambil Foto dengan Kamera di Flutter**

Selesaikan langkah-langkah praktikum berikut ini menggunakan editor Visual Studio Code (VS Code) atau Android Studio atau code editor lain kesukaan Anda.

> **Perhatian**: Diasumsikan Anda telah berhasil melakukan setup environment Flutter SDK VSCode, Flutter Plugin, dan Android SDK pada pertemuan pertama.

### **Langkah 1: Buat Project Baru**

Buatlah sebuah project flutter baru dengan nama **kamera_flutter**, lalu sesuaikan style laporan praktikum yang Anda buat.

![alt text](kamera_flutter/images/kamera.png)

> **Penjelasan**: Langkah ini membuat struktur dasar project Flutter yang akan digunakan untuk mengimplementasikan fitur kamera.

---

### **Langkah 2: Tambah dependensi yang diperlukan**

Anda memerlukan tiga dependensi pada project flutter untuk menyelesaikan praktikum ini.

- `camera` → menyediakan seperangkat alat untuk bekerja dengan kamera pada device.
- `path_provider` → menyediakan lokasi atau path untuk menyimpan hasil foto.
- `path` → membuat path untuk mendukung berbagai platform.

Untuk menambahkan dependensi plugin, jalankan perintah `flutter pub add` seperti berikut di terminal:

```bash
flutter pub add camera path_provider path
```

![alt text](kamera_flutter/images/flutter_pub_add.png)

> **Penjelasan**: Menambahkan plugin yang diperlukan untuk mengakses kamera, mengelola file path, dan menyimpan gambar di berbagai platform (Android/iOS).

> **Tips**
> * Untuk Android, Anda harus update variabel `minSdkVersion = 21` (atau lebih tinggi) pada file `gradle`.
> * Pada iOS, baris kode berikut harus ditambahkan pada file `ios/Runner/Info.plist` untuk mengakses kamera dan microphone.

```xml
<key>NSCameraUsageDescription</key>
<string>Explanation on why the camera access is needed.</string>
<key>NSMicrophoneUsageDescription</key>
<string>Explanation on why the microphone access is needed.</string>
```

---

### **Langkah 3: Ambil Sensor Kamera dari device**

Selanjutnya, kita perlu mengecek jumlah kamera yang tersedia pada perangkat menggunakan plugin `camera` seperti pada kode berikut ini. Kode ini letakkan dalam `void main()`.

**lib/main.dart**

```dart
// Ensure that plugin services are initialized so that `availableCameras()`
// can be called before `runApp()`
WidgetsFlutterBinding.ensureInitialized();

// Obtain a list of the available cameras on the device.
final cameras = await availableCameras();

// Get a specific camera from the list of available cameras.
final firstCamera = cameras.first;
```

Ubah `void main()` menjadi async function seperti berikut ini.

**lib/main.dart**

```dart
Future<void> main() async {
  ...
}
```

Pastikan melakukan impor plugin sesuai yang dibutuhkan.

> **Penjelasan**: Langkah ini menginisialisasi binding Flutter dan mengambil daftar kamera yang tersedia pada perangkat. Fungsi `main()` dibuat async karena `availableCameras()` adalah operasi asynchronous yang memerlukan waktu untuk mengakses hardware kamera.

---

### **Langkah 4: Buat dan inisialisasi CameraController**

Setelah Anda dapat mengakses kamera, gunakan langkah-langkah berikut untuk membuat dan menginisialisasi `CameraController`. Pada langkah berikut ini, Anda akan membuat koneksi ke kamera perangkat yang memungkinkan Anda untuk mengontrol kamera dan menampilkan pratinjau umpan kamera.

1. Buat `StatefulWidget` dengan kelas `State` pendamping.
2. Tambahkan variabel ke kelas `State` untuk menyimpan `CameraController`.
3. Tambahkan variabel ke kelas `State` untuk menyimpan `Future` yang dikembalikan dari `CameraController.initialize()`.
4. Buat dan inisialisasi controller dalam metode `initState()`.
5. Hapus controller dalam metode `dispose()`.

**lib/widget/takepicture_screen.dart**

```dart
// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next steps.
    return Container();
  }
}
```

> **Penjelasan**: `CameraController` adalah objek yang mengelola koneksi ke kamera perangkat. Controller ini diinisialisasi di `initState()` dan harus di-dispose di `dispose()` untuk mencegah memory leak. `Future` digunakan karena inisialisasi kamera memerlukan waktu.

> **Perhatian**: Jika Anda tidak menginisialisasi `CameraController`, Anda tidak dapat menggunakan kamera untuk menampilkan pratinjau dan mengambil gambar.

---

### **Langkah 5: Gunakan CameraPreview untuk menampilkan preview foto**

Gunakan widget `CameraPreview` dari package `camera` untuk menampilkan preview foto. Anda perlu tipe objek void berupa `FutureBuilder` untuk menangani proses async.

> **Perhatian**: Pada kode ini Anda perlu logic untuk menunggu controller selesai proses inisialisasi sebelum bekerja dengan kamera. Anda harus menunggu hasil dari method `_initializeControllerFuture()`, yang telah dibuat sebelumnya, agar dapat menampilkan preview foto dengan `CameraPreview`.

**lib/widget/takepicture_screen.dart**

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Take a picture - NIM Anda')),
    // You must wait until the controller is initialized before displaying the
    // camera preview. Use a FutureBuilder to display a loading spinner until the
    // controller has finished initializing.
    body: FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return CameraPreview(_controller);
        } else {
          // Otherwise, display a loading indicator.
          return const Center(child: CircularProgressIndicator());
        }
      },
    ),
  );
}
```

> **Penjelasan**: `FutureBuilder` menunggu inisialisasi kamera selesai. Jika sudah selesai (`ConnectionState.done`), akan menampilkan preview kamera. Jika belum, akan menampilkan loading indicator.

---

### **Langkah 6: Ambil foto dengan CameraController**

Anda dapat menggunakan `CameraController` untuk mengambil gambar menggunakan metode `takePicture()`, yang mengembalikan objek `XFile`, merupakan sebuah objek abstraksi `File` lintas platform yang disederhanakan. Pada Android dan iOS, gambar baru disimpan dalam direktori cache masing-masing, dan `path` ke lokasi tersebut dikembalikan dalam `XFile`.

Pada codelab ini, buatlah sebuah `FloatingActionButton` yang digunakan untuk mengambil gambar menggunakan `CameraController` saat pengguna mengetuk tombol.

Pengambilan gambar memerlukan 2 langkah:

1. Pastikan kamera telah diinisialisasi.
2. Gunakan controller untuk mengambil gambar dan pastikan ia mengembalikan objek `Future`.

Praktik baik untuk membungkus operasi kode ini dalam blok `try / catch` guna menangani berbagai kesalahan yang mungkin terjadi.

Kode berikut letakkan dalam `Widget build` setelah field `body`.

**lib/widget/takepicture_screen.dart**

```dart
FloatingActionButton(
  // Provide an onPressed callback.
  onPressed: () async {
    // Take the Picture in a try / catch block. If anything goes wrong,
    // catch the error.
    try {
      // Ensure that the camera is initialized.
      await _initializeControllerFuture;

      // Attempt to take a picture and then get the location
      // where the image file is saved.
      final image = await _controller.takePicture();
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  },
  child: const Icon(Icons.camera_alt),
)
```

> **Penjelasan**: FloatingActionButton dengan icon kamera berfungsi sebagai tombol untuk mengambil foto. Metode `takePicture()` mengembalikan objek `XFile` yang berisi path file gambar yang tersimpan di cache. Try-catch digunakan untuk menangani error yang mungkin terjadi saat pengambilan foto.

---

### **Langkah 7: Buat widget baru DisplayPictureScreen**

Buatlah file baru pada folder widget yang berisi kode berikut.

**lib/widget/displaypicture_screen.dart**

```dart
// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture - NIM Anda')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}
```

> **Penjelasan**: Widget ini menampilkan hasil foto yang telah diambil. `Image.file()` digunakan untuk membaca dan menampilkan gambar dari path file lokal yang diterima sebagai parameter.

---

### **Langkah 8: Edit main.dart**

Edit pada file ini bagian runApp seperti kode berikut.

**lib/main.dart**

```dart
runApp(
  MaterialApp(
    theme: ThemeData.dark(),
    home: TakePictureScreen(
      // Pass the appropriate camera to the TakePictureScreen widget.
      camera: firstCamera,
    ),
    debugShowCheckedModeBanner: false,
  ),
);
```

> **Penjelasan**: Mengubah entry point aplikasi menjadi `TakePictureScreen` dengan tema gelap dan melewatkan objek kamera pertama yang telah didapatkan sebelumnya.

---

### **Langkah 9: Menampilkan hasil foto**

Tambahkan kode seperti berikut pada bagian `try / catch` agar dapat menampilkan hasil foto pada DisplayPictureScreen.

**lib/widget/takepicture_screen.dart**

```dart
// Take the Picture in a try / catch block. If anything goes wrong,
// catch the error.
try {
  // Ensure that the camera is initialized.
  await _initializeControllerFuture;

  // Attempt to take a picture and get the file `image`
  // where it was saved.
  final image = await _controller.takePicture();

  if (!context.mounted) return;

  // If the picture was taken, display it on a new screen.
  await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => DisplayPictureScreen(
        // Pass the automatically generated path to
        // the DisplayPictureScreen widget.
        imagePath: image.path,
      ),
    ),
  );
} catch (e) {
  // If an error occurs, log the error to the console.
  print(e);
}
```

> **Penjelasan**: Setelah foto berhasil diambil, aplikasi melakukan navigasi ke `DisplayPictureScreen` dengan melewatkan path gambar. `context.mounted` memastikan widget masih aktif sebelum melakukan navigasi untuk menghindari error.

---

### **Hasil dari Kode Program**

![alt text](kamera_flutter/images/Kamera.gif)

> **Penjelasan Hasil**: Aplikasi kamera berhasil berjalan dengan baik. User dapat melihat preview kamera secara real-time, mengambil foto dengan menekan tombol kamera floating action button, dimana foto yang diambil akan otomatis ditampilkan pada layar baru (DisplayPictureScreen) dan tersimpan di direktori cache perangkat dalam format XFile.

Silakan deploy pada device atau smartphone Anda dan perhatikan hasilnya! 🙂

---

## **Praktikum 2: Membuat photo filter carousel**

Semua orang tahu bahwa foto akan terlihat lebih bagus dengan filter. Pada codelab ini, Anda akan membuat rangkaian pilihan filter yang dapat digeser sesuai pilihan warna.

Berikut ini menunjukkan aplikasi yang akan Anda buat:

<img src="https://jti-polinema.github.io/flutter-codelab/09-kamera/img//d6bc522d40ee316e.gif"/>

Selesaikan langkah-langkah praktikum berikut ini.

---

### **Langkah 1: Buat project baru**

Buatlah project flutter baru di pertemuan 09 dengan nama **photo_filter_carousel**

![alt text](photo_filter_carousel/images/Filter.png)

> **Penjelasan**: Membuat project baru khusus untuk implementasi filter carousel pada foto.

---

### **Langkah 2: Buat widget Selector ring dan dark gradient**

Buatlah folder `widget` dan file baru yang berisi kode berikut.

**lib/widget/filter_selector.dart**

```dart
@immutable
class FilterSelector extends StatefulWidget {
  const FilterSelector({
    super.key,
    required this.filters,
    required this.onFilterChanged,
    this.padding = const EdgeInsets.symmetric(vertical: 24),
  });

  final List<Color> filters;
  final void Function(Color selectedColor) onFilterChanged;
  final EdgeInsets padding;

  @override
  State<FilterSelector> createState() => _FilterSelectorState();
}

class _FilterSelectorState extends State<FilterSelector> {
  static const _filtersPerScreen = 5;
  static const _viewportFractionPerItem = 1.0 / _filtersPerScreen;

  late final PageController _controller;
  late int _page;

  int get filterCount => widget.filters.length;

  Color itemColor(int index) => widget.filters[index % filterCount];

  @override
  void initState() {
    super.initState();
    _page = 0;
    _controller = PageController(
      initialPage: _page,
      viewportFraction: _viewportFractionPerItem,
    );
    _controller.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final page = (_controller.page ?? 0).round();
    if (page != _page) {
      _page = page;
      widget.onFilterChanged(widget.filters[page]);
    }
  }

  void _onFilterTapped(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 450),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollable(
      controller: _controller,
      axisDirection: AxisDirection.right,
      physics: const PageScrollPhysics(),
      viewportBuilder: (context, viewportOffset) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final itemSize = constraints.maxWidth * _viewportFractionPerItem;
            viewportOffset
              ..applyViewportDimension(constraints.maxWidth)
              ..applyContentDimensions(0.0, itemSize * (filterCount - 1));

            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _buildShadowGradient(itemSize),
                _buildCarousel(
                  viewportOffset: viewportOffset,
                  itemSize: itemSize,
                ),
                _buildSelectionRing(itemSize),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildShadowGradient(double itemSize) {
    return SizedBox(
      height: itemSize * 2 + widget.padding.vertical,
      child: const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black,
            ],
          ),
        ),
        child: SizedBox.expand(),
      ),
    );
  }

  Widget _buildCarousel({
    required ViewportOffset viewportOffset,
    required double itemSize,
  }) {
    return Container(
      height: itemSize,
      margin: widget.padding,
      child: Flow(
        delegate: CarouselFlowDelegate(
          viewportOffset: viewportOffset,
          filtersPerScreen: _filtersPerScreen,
        ),
        children: [
          for (int i = 0; i < filterCount; i++)
            FilterItem(
              onFilterSelected: () => _onFilterTapped(i),
              color: itemColor(i),
            ),
        ],
      ),
    );
  }

  Widget _buildSelectionRing(double itemSize) {
    return IgnorePointer(
      child: Padding(
        padding: widget.padding,
        child: SizedBox(
          width: itemSize,
          height: itemSize,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.fromBorderSide(
                BorderSide(width: 6, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

> **Penjelasan**: Widget ini membuat carousel selector dengan ring putih sebagai indikator filter yang dipilih. Menggunakan `PageController` untuk mengatur scroll horizontal dan `Flow` widget untuk animasi transisi antar filter.

---

### **Langkah 3: Buat widget photo filter carousel**

Buat file baru di folder widget dengan kode seperti berikut.

**lib/widget/filter_carousel.dart**

```dart
@immutable
class PhotoFilterCarousel extends StatefulWidget {
  const PhotoFilterCarousel({super.key});

  @override
  State<PhotoFilterCarousel> createState() => _PhotoFilterCarouselState();
}

class _PhotoFilterCarouselState extends State<PhotoFilterCarousel> {
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(
            child: _buildPhotoWithFilter(),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: _buildFilterSelector(),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoWithFilter() {
    return ValueListenableBuilder(
      valueListenable: _filterColor,
      builder: (context, color, child) {
        // Anda bisa ganti dengan foto Anda sendiri
        return Image.network(
          'https://docs.flutter.dev/cookbook/img-files'
          '/effects/instagram-buttons/millennial-dude.jpg',
          color: color.withOpacity(0.5),
          colorBlendMode: BlendMode.color,
          fit: BoxFit.cover,
        );
      },
    );
  }

  Widget _buildFilterSelector() {
    return FilterSelector(
      onFilterChanged: _onFilterChanged,
      filters: _filters,
    );
  }
}
```

> **Penjelasan**: Widget utama yang menggabungkan foto dengan filter selector. Menggunakan `ValueNotifier` untuk reactive state management warna filter dan `Stack` untuk overlay filter selector di atas foto.

---

### **Langkah 4: Membuat filter warna - bagian 1**

Buat file baru di folder widget seperti kode berikut.

**lib/widget/carousel_flowdelegate.dart**

```dart
class CarouselFlowDelegate extends FlowDelegate {
  CarouselFlowDelegate({
    required this.viewportOffset,
    required this.filtersPerScreen,
  }) : super(repaint: viewportOffset);

  final ViewportOffset viewportOffset;
  final int filtersPerScreen;

  @override
  void paintChildren(FlowPaintingContext context) {
    final count = context.childCount;

    // All available painting width
    final size = context.size.width;

    // The distance that a single item "page" takes up from the perspective
    // of the scroll paging system. We also use this size for the width and
    // height of a single item.
    final itemExtent = size / filtersPerScreen;

    // The current scroll position expressed as an item fraction, e.g., 0.0,
    // or 1.0, or 1.3, or 2.9, etc. A value of 1.3 indicates that item at
    // index 1 is active, and the user has scrolled 30% towards the item at
    // index 2.
    final active = viewportOffset.pixels / itemExtent;

    // Index of the first item we need to paint at this moment.
    // At most, we paint 3 items to the left of the active item.
    final min = math.max(0, active.floor() - 3).toInt();

    // Index of the last item we need to paint at this moment.
    // At most, we paint 3 items to the right of the active item.
    final max = math.min(count - 1, active.ceil() + 3).toInt();

    // Generate transforms for the visible items and sort by distance.
    for (var index = min; index <= max; index++) {
      final itemXFromCenter = itemExtent * index - viewportOffset.pixels;
      final percentFromCenter = 1.0 - (itemXFromCenter / (size / 2)).abs();
      final itemScale = 0.5 + (percentFromCenter * 0.5);
      final opacity = 0.25 + (percentFromCenter * 0.75);

      final itemTransform = Matrix4.identity()
        ..translate((size - itemExtent) / 2)
        ..translate(itemXFromCenter)
        ..translate(itemExtent / 2, itemExtent / 2)
        ..multiply(Matrix4.diagonal3Values(itemScale, itemScale, 1.0))
        ..translate(-itemExtent / 2, -itemExtent / 2);

      context.paintChild(
        index,
        transform: itemTransform,
        opacity: opacity,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CarouselFlowDelegate oldDelegate) {
    return oldDelegate.viewportOffset != viewportOffset;
  }
}
```

> **Penjelasan**: `FlowDelegate` custom yang mengatur layout dan animasi item filter dalam carousel. Menghitung posisi, scale, dan opacity setiap item berdasarkan scroll position untuk menciptakan efek 3D carousel.

---

### **Langkah 5: Membuat filter warna**

Buat file baru di folder widget seperti kode berikut ini.

**lib/widget/filter_item.dart**

```dart
@immutable
class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.color,
    this.onFilterSelected,
  });

  final Color color;
  final VoidCallback? onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterSelected,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ClipOval(
            child: Image.network(
              'https://docs.flutter.dev/cookbook/img-files'
              '/effects/instagram-buttons/millennial-texture.jpg',
              color: color.withOpacity(0.5),
              colorBlendMode: BlendMode.hardLight,
            ),
          ),
        ),
      ),
    );
  }
}
```

> **Penjelasan**: Widget individual untuk setiap item filter. Menampilkan preview tekstur dengan warna filter yang diterapkan menggunakan `ColorBlendMode`. Dapat diklik untuk memilih filter tersebut.

---

### **Langkah 6: Implementasi filter carousel**

Terakhir, kita impor widget PhotoFilterCarousel ke main seperti kode berikut ini.

**lib/main.dart**

```dart
void main() {
  runApp(
    const MaterialApp(
      home: PhotoFilterCarousel(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
```

> **Penjelasan**: Mengatur `PhotoFilterCarousel` sebagai home screen aplikasi untuk menampilkan foto dengan filter carousel yang dapat dipilih.

---

### **Troubleshoot**

Jika diperlukan, beberapa widget yang telah Anda buat sebelumnya, memerlukan kode import berikut ini.

```dart
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show ViewportOffset;
```

---

### **Hasil dari Kode Program**

![alt text](photo_filter_carousel/images/Filter.gif)

> **Penjelasan Hasil**: Aplikasi filter carousel berhasil ditampilkan. Foto dari internet ditampilkan sebagai background utama aplikasi. Carousel filter dapat di-scroll secara horizontal menggunakan gesture swipe untuk memilih filter yang diinginkan. Filter yang dipilih akan ditandai dengan ring putih dan langsung diaplikasikan ke foto secara real-time. Terdapat efek 3D carousel yang membuat item filter di tengah tampak lebih besar dan item di samping tampak lebih kecil. Gradient shadow ditampilkan di bagian bawah untuk memberikan efek visual yang lebih baik. Seluruh transisi animasi antar filter berjalan dengan smooth dan responsif.

---

## **Tugas Praktikum**

1. Selesaikan Praktikum 1 dan 2, lalu dokumentasikan dan push ke repository Anda berupa screenshot setiap hasil pekerjaan beserta penjelasannya di file `README.md`! Jika terdapat error atau kode yang tidak dapat berjalan, silakan Anda perbaiki sesuai tujuan aplikasi dibuat!

2. Gabungkan hasil praktikum 1 dengan hasil praktikum 2 sehingga setelah melakukan pengambilan foto, dapat dibuat filter carouselnya!

---

### **Menerapkan Kamera dan Filter**

#### **1. Membuat projek baru dengan nama kamera_filter**

![alt text](kamera_filter/images/kamera_filter.png)

> **Penjelasan**: Membuat project baru yang akan menggabungkan fitur kamera dari Praktikum 1 dengan filter carousel dari Praktikum 2.

---

#### **2. Menambahkan dependensi kamera**

```bash
flutter pub add camera path_provider path
```

![alt text](kamera_filter/images/dependensi.png)

> **Penjelasan**: Menambahkan dependensi yang sama dengan Praktikum 1 untuk mendukung fitur kamera.

---

#### **3. Merubah versi minSDK menjadi 21 pada file android/app/build.gradle.kts**

> **Penjelasan**: Android memerlukan minimum SDK 21 untuk mendukung fitur kamera plugin Flutter.

---

#### **4. Membuat struktur folder**

> **Penjelasan**: Mengorganisir kode dengan membuat folder `screens` untuk layar utama dan `widgets` untuk komponen reusable.

---

#### **5. Buat file lib/widgets/carousel_flowdelegate.dart dan isi dengan kode berikut:**

```dart
// (Tambahkan import di bagian atas - lihat bagian Troubleshoot di akhir)
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show ViewportOffset;

class CarouselFlowDelegate extends FlowDelegate {
  CarouselFlowDelegate({
    required this.viewportOffset,
    required this.filtersPerScreen,
  }) : super(repaint: viewportOffset);

  final ViewportOffset viewportOffset;
  final int filtersPerScreen;

  @override
  void paintChildren(FlowPaintingContext context) {
    final count = context.childCount;
    final size = context.size.width;
    final itemExtent = size / filtersPerScreen;
    final active = viewportOffset.pixels / itemExtent;
    final min = math.max(0, active.floor() - 3).toInt();
    final max = math.min(count - 1, active.ceil() + 3).toInt();

    for (var index = min; index <= max; index++) {
      final itemXFromCenter = itemExtent * index - viewportOffset.pixels;
      final percentFromCenter = 1.0 - (itemXFromCenter / (size / 2)).abs();
      final itemScale = 0.5 + (percentFromCenter * 0.5);
      final opacity = 0.25 + (percentFromCenter * 0.75);

      final itemTransform = Matrix4.identity()
        ..translate((size - itemExtent) / 2)
        ..translate(itemXFromCenter)
        ..translate(itemExtent / 2, itemExtent / 2)
        ..multiply(Matrix4.diagonal3Values(itemScale, itemScale, 1.0))
        ..translate(-itemExtent / 2, -itemExtent / 2);

      context.paintChild(index, transform: itemTransform, opacity: opacity);
    }
  }

  @override
  bool shouldRepaint(covariant CarouselFlowDelegate oldDelegate) {
    return oldDelegate.viewportOffset != viewportOffset;
  }
}
```

> **Penjelasan**: Menggunakan kembali flow delegate dari Praktikum 2 untuk mengatur animasi carousel filter.

---

#### **6. Buat file lib/widgets/filter_item.dart dan isi dengan kode berikut:**

```dart
import 'package:flutter/material.dart';

@immutable
class FilterItem extends StatelessWidget {
  const FilterItem({super.key, required this.color, this.onFilterSelected});

  final Color color;
  final VoidCallback? onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterSelected,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ClipOval(
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTklNCRaoYjrsD2vnIPTrSTc8JE_lna45PxzQ&s',
              color: color.withOpacity(0.5),
              colorBlendMode: BlendMode.hardLight,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey,
                  child: const Icon(Icons.error, color: Colors.white),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
```

> **Penjelasan**: Widget item filter yang sama dengan Praktikum 2, digunakan untuk menampilkan preview filter.

---

#### **7. Buat file lib/widgets/filter_selector.dart dan isi dengan kode berikut:**

```dart
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show ViewportOffset;
import 'package:kamera_filter_app/widgets/carousel_flowdelegate.dart';
import 'package:kamera_filter_app/widgets/filter_item.dart';

@immutable
class FilterSelector extends StatefulWidget {
  const FilterSelector({
    super.key,
    required this.filters,
    required this.onFilterChanged,
    this.padding = const EdgeInsets.symmetric(vertical: 24),
  });

  final List<Color> filters;
  final void Function(Color selectedColor) onFilterChanged;
  final EdgeInsets padding;

  @override
  State<FilterSelector> createState() => _FilterSelectorState();
}

class _FilterSelectorState extends State<FilterSelector> {
  static const _filtersPerScreen = 5;
  static const _viewportFractionPerItem = 1.0 / _filtersPerScreen;

  late final PageController _controller;
  late int _page;

  int get filterCount => widget.filters.length;

  Color itemColor(int index) => widget.filters[index % filterCount];

  @override
  void initState() {
    super.initState();
    _page = 0;
    _controller = PageController(
      initialPage: _page,
      viewportFraction: _viewportFractionPerItem,
    );
    _controller.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final page = (_controller.page ?? 0).round();
    if (page != _page) {
      _page = page;
      widget.onFilterChanged(widget.filters[page]);
    }
  }

  void _onFilterTapped(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 450),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollable(
      controller: _controller,
      axisDirection: AxisDirection.right,
      physics: const PageScrollPhysics(),
      viewportBuilder: (context, viewportOffset) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final itemSize = constraints.maxWidth * _viewportFractionPerItem;
            viewportOffset
              ..applyViewportDimension(constraints.maxWidth)
              ..applyContentDimensions(0.0, itemSize * (filterCount - 1));

            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _buildShadowGradient(itemSize),
                _buildCarousel(viewportOffset: viewportOffset, itemSize: itemSize),
                _buildSelectionRing(itemSize),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildShadowGradient(double itemSize) {
    return SizedBox(
      height: itemSize * 2 + widget.padding.vertical,
      child: const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black],
          ),
        ),
        child: SizedBox.expand(),
      ),
    );
  }

  Widget _buildCarousel({required ViewportOffset viewportOffset, required double itemSize}) {
    return Container(
      height: itemSize,
      margin: widget.padding,
      child: Flow(
        delegate: CarouselFlowDelegate(
          viewportOffset: viewportOffset,
          filtersPerScreen: _filtersPerScreen,
        ),
        children: [
          for (int i = 0; i < filterCount; i++)
            FilterItem(onFilterSelected: () => _onFilterTapped(i), color: itemColor(i)),
        ],
      ),
    );
  }

  Widget _buildSelectionRing(double itemSize) {
    return IgnorePointer(
      child: Padding(
        padding: widget.padding,
        child: SizedBox(
          width: itemSize,
          height: itemSize,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.fromBorderSide(BorderSide(width: 6, color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
```

> **Penjelasan**: Widget selector yang sama dengan Praktikum 2 untuk memilih filter dalam bentuk carousel.

---

#### **8. Perbarui kode lib/main.dart dengan kode berikut:**

```dart
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kamera_filter_app/widget/takepicture_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(camera: firstCamera),
      debugShowCheckedModeBanner: false,
    ),
  );
}
```

> **Penjelasan**: Entry point aplikasi yang menginisialisasi kamera dan menjalankan `TakePictureScreen` sebagai halaman awal.

---

#### **9. Buat file baru di lib/screens/takepicture_screen.dart**

```dart
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kamera_filter_app/screens/filter_screen.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({super.key, required this.camera});

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture - 2341720005')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final image = await _controller.takePicture();

            if (!context.mounted) return;

            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FilterScreen(imagePath: image.path),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
```

> **Penjelasan**: Screen untuk mengambil foto, sama seperti Praktikum 1 tetapi setelah foto diambil akan menavigasi ke `FilterScreen` bukan `DisplayPictureScreen`.

---

#### **10. Buat file lib/screens/filter_screen.dart dan isi kode berikut:**

```dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kamera_filter_app/widgets/filter_selector.dart';

class FilterScreen extends StatefulWidget {
  final String imagePath;

  const FilterScreen({super.key, required this.imagePath});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    ),
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apply Filter - 2341720005')),
      body: Material(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(child: _buildPhotoWithFilter()),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: _buildFilterSelector(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoWithFilter() {
    return ValueListenableBuilder(
      valueListenable: _filterColor,
      builder: (context, color, child) {
        return Image.file(
          File(widget.imagePath),
          color: color.withOpacity(0.5),
          colorBlendMode: BlendMode.color,
          fit: BoxFit.cover,
        );
      },
    );
  }

  Widget _buildFilterSelector() {
    return FilterSelector(
      onFilterChanged: _onFilterChanged,
      filters: _filters,
    );
  }
}
```

> **Penjelasan**: Screen gabungan yang menampilkan foto yang telah diambil dengan filter carousel di bawahnya. Menggabungkan logika dari `DisplayPictureScreen` (Praktikum 1) dan `PhotoFilterCarousel` (Praktikum 2). Foto yang ditampilkan adalah hasil dari kamera, bukan dari internet seperti di Praktikum 2.

---

### **Hasil dari Kode Program**

![alt text](kamera_filter/images/kamera_filter.gif)

> **Penjelasan Hasil**: Aplikasi gabungan kamera dan filter berhasil diimplementasikan dari dua tahap utama. Pada tahap pertama (TakePictureScreen), user dapat melihat preview kamera secara real-time dan mengambil foto dengan menekan tombol kamera. Setelah foto diambil, aplikasi otomatis berpindah ke tahap kedua (FilterScreen) yang menampilkan foto hasil jepretan (bukan dari internet) sebagai background dengan carousel filter yang berisi lebih dari 18 pilihan warna di bagian bawah layar. Filter dapat dipilih dengan cara tap atau swipe, dan perubahan filter langsung terlihat pada foto secara real-time. Ring putih berfungsi sebagai penanda filter yang sedang aktif. Integrasi sempurna antara fungsionalitas kamera hardware dengan manipulasi visual filter menggunakan color blend mode menghasilkan user experience yang smooth, dimana alur dari mengambil foto hingga menerapkan filter berjalan lancar tanpa perlu menyimpan atau memuat ulang gambar.

---

### **3. Jelaskan maksud `void async` pada praktikum 1?**

**Jawaban**: `Future<void> async` (bukan `void async`) menandakan bahwa fungsi tersebut adalah asynchronous function yang tidak mengembalikan nilai (void). Keyword `async` memungkinkan penggunaan `await` di dalam fungsi untuk menunggu operasi asynchronous selesai, seperti inisialisasi kamera dengan `availableCameras()` yang memerlukan waktu untuk mengakses hardware kamera.

---

### **4. Jelaskan fungsi dari anotasi `@immutable` dan `@override`?**

**Jawaban**:

- `@immutable`: Menandakan bahwa class tersebut adalah immutable (tidak dapat diubah). Semua field dalam class harus final. Ini membantu Flutter mengoptimalkan performa dengan memastikan widget tidak berubah setelah dibuat.
- `@override`: Menandakan bahwa method tersebut meng-override method dari parent class. Ini membantu menghindari error jika nama method salah dan meningkatkan code readability.

---

### **5. Kumpulkan link commit repository GitHub Anda kepada dosen yang telah disepakati!**