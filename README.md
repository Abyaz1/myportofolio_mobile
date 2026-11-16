# Portfolio Mobile - Mata Kuliah Pemrograman Berbasis Platform

Nama : M Naufal Abyaz Bawono  
NPM : 2506656993  
Kelas : PBP B  

Aplikasi mobile portofolio pribadi yang dirancang menggunakan framework Flutter dan Material Design 3.

## Daftar Isi
- [Tentang Proyek](#tentang-proyek)
- [Fitur Utama & Kreativitas](#fitur-utama--kreativitas)
- [Struktur Direktori](#struktur-direktori)
- [Panduan Setup & Instalasi](#panduan-setup--instalasi)
- [Tugas 7](#tugas-7)
- [Progress Mingguan](#progress-mingguan)
- [AI Disclosure](#ai-disclosure)
- [Kontak](#kontak)


## Tentang Proyek
Proyek ini adalah aplikasi mobile portofolio pribadi yang dibuat menggunakan framework Flutter untuk memenuhi tugas individu mata kuliah Pemrograman Berbasis Platform (CSGE602022) di Fakultas Ilmu Komputer, Universitas Indonesia. Aplikasi ini menyajikan antarmuka portofolio personal yang interaktif, modular, dan mengikuti prinsip desain Material Design 3.

## Fitur Utama & Kreativitas
1. Header & Informasi Profil (`InfoCard`):
   Menampilkan tiga kartu ringkasan identitas pemilik portofolio secara sejajar di bagian atas layar: NPM (2506656993), Nama (M. Naufal Abyaz Bawono), dan Kelas (PBP B).
2. Menu Aksi Portofolio (`ItemCard`):
   Menampilkan menu aksi utama dalam tata letak kisi (*grid layout* 3 kolom):
   - Lihat Proyek: Tombol dengan latar belakang biru (`Colors.blue`) dan ikon folder.
   - Tambah Proyek: Tombol dengan latar belakang hijau (`Colors.green`) dan ikon tambah.
   - Logout: Tombol dengan latar belakang merah (`Colors.red`) dan ikon keluar.
3. Aspek Kreativitas & Peningkatan Interaktivitas (`Custom SnackBar`):
   Sebagai pemenuhan aspek kreativitas untuk mencapai nilai maksimal, `SnackBar` ditingkatkan menjadi responsif dan selaras secara visual:
   - Warna latar belakang `SnackBar` otomatis menyesuaikan dengan warna tombol kartu yang ditekan (`backgroundColor: item.color`).
   - Menampilkan ikon tombol yang sesuai di dalam baris notifikasi pesan.
   - Dilengkapi tombol aksi interaktif `SnackBarAction(label: 'Tutup')` untuk menutup pesan secara instan.
4. Struktur Kode Modular & Bersih:
   - Pemisahan berkas bootstrap (`lib/main.dart`) dan halaman utama (`lib/menu.dart`).
   - Penggunaan model `ItemHomepage` yang efisien dengan parameter warna modular tanpa logika percabangan berulang.
   - Seluruh komentar dalam kode ditulis secara rapi menggunakan komentar satu baris (`//`).
   - Lulus analisis statis `flutter analyze` dengan status *No issues found!*.

## Struktur Direktori

```text
myportofolio_mobile/
├── android/             # Konfigurasi dan berkas build native platform Android
├── ios/                 # Konfigurasi dan berkas build native platform iOS
├── lib/
│   ├── main.dart        # Entry point aplikasi & konfigurasi tema global
│   └── menu.dart        # Halaman utama (MyHomePage), InfoCard, & ItemCard
├── test/
│   └── widget_test.dart # Berkas pengujian otomatis widget Flutter
├── pubspec.yaml         # Manajemen dependensi pustaka, font, dan aset
└── README.md            # Dokumentasi proyek & laporan refleksi tugas
```

## Panduan Setup & Instalasi

Pastikan Anda telah memasang Flutter SDK (versi >= 3.0.0), Dart SDK, dan Git pada perangkat Anda.

### 1. Clone Repositori
```bash
git clone https://github.com/Abyaz1/myportofolio_mobile.git
cd myportofolio_mobile
```

### 2. Install Dependensi
```bash
flutter pub get
```

### 3. Analisis Kode & Pengujian
```bash
flutter analyze
flutter test
```

### 4. Jalankan Aplikasi
```bash
flutter run
```

## Tugas 7

### 1. Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget!

Widget tree adalah struktur data hierarkis berbentuk pohon yang dibentuk oleh kumpulan widget untuk menyusun antarmuka pengguna pada aplikasi Flutter. Di Flutter, hampir seluruh elemen visual maupun fungsional (seperti tata letak, padding, teks, hingga penangan gestur) direpresentasikan sebagai widget.

Hubungan induk-anak (parent-child) bekerja dengan aturan berikut:
- Komposisi Hierarkis: Sebuah widget induk (parent) dapat membungkus satu anak (`child: Widget`, contohnya `Padding`, `Center`, `Material`) atau banyak anak (`children: List<Widget>`, contohnya `Row`, `Column`, `GridView`).
- Mekanisme constraints down, sizes up, parent sets position:
  1. Constraints go down: Induk meneruskan batasan ukuran (box constraints, yaitu lebar dan tinggi minimum serta maksimum) ke widget anak-anaknya.
  2. Sizes go up: Anak menentukan ukuran dirinya sendiri berdasarkan batasan yang diberikan induknya, lalu mengabarkan ukuran tersebut kembali ke induk.
  3. Parent sets position: Induk menentukan koordinat posisi penempatan anak pada layar (misalnya melalui perataan pada `Row` atau `Column`).
- Efisiensi Rekonstruksi: Widget tree bersifat *immutable* dan ringan (*lightweight*). Ketika terjadi perubahan state, Flutter hanya merekonstruksi sub-pohon yang terpengaruh, lalu menyelaraskannya dengan Element Tree dan RenderObject Tree di balik layar untuk proses rendering yang optimal ke GPU.

### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!

Berikut adalah widget yang digunakan dalam proyek ini beserta fungsinya:
- `MyApp`: Widget akar (root) aplikasi yang menginisialisasi konfigurasi global.
- `MaterialApp`: Widget pembungkus tingkat atas yang mengonfigurasi tema Material Design, routing/navigasi, dan lokalisasi aplikasi.
- `ThemeData` & `ColorScheme`: Mengonfigurasi skema warna global aplikasi (warna primer, sekunder, dan seed color) serta mengaktifkan Material 3.
- `MyHomePage`: Widget halaman utama yang menampilkan profil pengembang dan kisi menu aksi portofolio.
- `Scaffold`: Menyediakan kerangka dasar tata letak visual halaman Material Design, termasuk `appBar` dan `body`.
- `AppBar`: Menampilkan bilah navigasi bagian atas halaman aplikasi dengan judul dan latar belakang berwarna primer.
- `Text`: Menampilkan teks string ke antarmuka layar dengan pengaturan gaya (seperti ukuran, ketebalan, dan warna teks).
- `Padding`: Memberikan jarak ruang kosong (*insets*) di sekeliling widget anaknya.
- `Column`: Mengatur tata letak widget anak-anaknya secara vertikal (berurutan dari atas ke bawah).
- `Row`: Mengatur tata letak widget anak-anaknya secara horizontal (sejajar dari kiri ke kanan).
- `Center`: Menempatkan widget anaknya tepat di tengah ruang yang tersedia.
- `SizedBox`: Memberikan ruang spasi kosong dengan dimensi lebar atau tinggi yang telah ditentukan antar-widget.
- `Card`: Menampilkan kontainer berbentuk kartu dengan efek bayangan elevasi dan sudut melengkung.
- `Container`: Widget serbaguna untuk membungkus elemen dengan pengaturan ukuran lebar, tinggi, dan padding.
- `GridView.count`: Menata widget anak-anaknya ke dalam kisi (*grid*) dua dimensi dengan jumlah kolom yang telah ditentukan (`crossAxisCount: 3`).
- `Material`: Kanvas visual Material Design yang mengatur warna latar belakang kartu dan menjadi wadah penampung efek animasi.
- `InkWell`: Menangani gestur ketukan (*tap*) pengguna serta memberikan animasi riak sentuhan (*ink ripple effect*).
- `Icon`: Menampilkan simbol ikon grafis dari pustaka bawaan `Icons` (seperti `Icons.folder`, `Icons.add_circle`, `Icons.logout`).
- `SnackBar`: Menampilkan bilah informasi notifikasi singkat sementara di bagian bawah layar melalui `ScaffoldMessenger`.
- `SnackBarAction`: Tombol interaktif di dalam SnackBar untuk memicu tindakan instan (menutup SnackBar).
- `Expanded`: Memastikan teks di dalam `Row` pada SnackBar mengisi sisa ruang yang tersedia tanpa menyebabkan *overflow*.
- `InfoCard`: Komponen modular untuk menyajikan label judul dan nilai data profil pengguna.
- `ItemCard`: Komponen modular untuk menyajikan tombol kartu menu aksi lengkap dengan penanganan aksi *tap*, warna khusus, dan ikon.

### 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!

Fungsi `MaterialApp`:
`MaterialApp` berperan sebagai gerbang utama (*entry point*) untuk aplikasi yang mengadopsi pedoman Google Material Design. Widget ini menyediakan konfigurasi penting seperti `theme` (tema global), `routes`/`onGenerateRoute` (sistem navigasi antar-halaman), `title` (nama aplikasi di tingkat sistem operasi), serta konfigurasi lokalisasi dan internasionalisasi bahasa.

Alasan digunakan sebagai root widget:
- `MaterialApp` secara otomatis menyuntikkan berbagai *InheritedWidget* esensial ke dalam pohon hierarki widget, antara lain `Theme`, `MediaQuery` (penyedia informasi dimensi layar, rotasi, padding sistem), `Navigator` (manajemen perpindahan layar), `Directionality` (arah pembacaan teks LTR/RTL), dan `Overlay` (lapisan untuk menampilkan Dialog, SnackBar, Tooltip).
- Sebagian besar komponen antarmuka Material (seperti `Scaffold`, `AppBar`, `SnackBar`, `Card`) membutuhkan layanan dan konteks dari *InheritedWidget* tersebut. Tanpa `MaterialApp` di posisi root, widget-widget Material tersebut akan memunculkan galat (*assertion error*) saat dijalankan.

### 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget?

Perbedaan mendasar:
- `StatelessWidget`: Bersifat statis dan tidak dapat diubah setelah dibuat (*immutable*). Widget ini tidak memiliki keadaan internal (*state*) yang dapat berubah selama siklus hidupnya (*lifecycle*). Tampilan antarmuka hanya bergantung pada argumen atau konfigurasi yang dioper saat instansiasi melalui constructor.
- `StatefulWidget`: Memiliki objek `State` terpisah yang bersifat dinamis dan dapat bertahan sepanjang siklus hidup widget. Ketika data pada objek state berubah dan fungsi `setState()` dipanggil, framework Flutter akan menjadwalkan pembangunan ulang (*rebuild*) pada metode `build()` milik objek state tersebut sehingga UI diperbarui secara reaktif.

Kapan memilih `StatelessWidget`:
Ketika elemen antarmuka bersifat murni presentasional dan tidak berubah berdasarkan interaksi pengguna atau peristiwa internal di dalam widget tersebut. Contohnya teks statis, ikon, kartu profil identitas (`InfoCard`), dan tombol navigasi sederhana (`ItemCard`).

Kapan memilih `StatefulWidget`:
Ketika elemen antarmuka memerlukan pelacakan status lokal yang berubah secara dinamis akibat aksi pengguna atau pembaruan asinkron. Contohnya formulir input dengan validasi (*text field*), sakelar (*switch* atau *checkbox*), animasi interaktif, penghitung (*counter*), atau komponen pemroses data dinamis dari API.

### 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?

Pengertian `BuildContext`:
`BuildContext` merupakan objek pegangan (*handle*) yang merepresentasikan lokasi atau posisi spesifik suatu widget di dalam *widget tree*. Setiap widget memiliki `BuildContext`-nya sendiri yang diteruskan sebagai argumen pada metode `build(BuildContext context)`.

Urgensi `BuildContext`:
- Menjadi sarana bagi suatu widget untuk mengenali posisinya di dalam pohon hierarki dan mengakses widget leluhur (*ancestor widgets*) di atasnya melalui mekanisme `InheritedWidget`.
- Menyediakan akses ke layanan global aplikasi, seperti data tema melalui `Theme.of(context)`, dimensi viewport melalui `MediaQuery.of(context)`, maupun pengelola notifikasi melalui `ScaffoldMessenger.of(context)`.

Penggunaan di dalam metode `build`:
- Pada proyek ini, `context` digunakan pada `InfoCard` untuk membaca ukuran lebar layar saat itu (`MediaQuery.of(context).size.width / 3.5`) guna menentukan lebar kartu secara proporsional.
- Pada `MyHomePage`, `context` digunakan untuk mengambil warna primer dari tema aplikasi (`Theme.of(context).colorScheme.primary`).
- Pada `ItemCard`, `context` digunakan oleh `ScaffoldMessenger.of(context)` untuk menemukan `Scaffold` terdekat dan memunculkan `SnackBar` saat tombol ditekan.

### 6. Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?

Konsep hot reload:
Fitur unggulan Flutter yang memanfaatkan kemampuan *Just-In-Time (JIT) compilation* pada Dart Virtual Machine. Fitur ini bekerja dengan menyuntikkan berkas kode sumber yang diperbarui secara langsung ke dalam Dart VM yang sedang berjalan di perangkat atau emulator, kemudian memicu pembangunan ulang (*rebuild*) pohon widget. Karakteristik utamanya adalah mempertahankan state aplikasi yang sedang berjalan (*state preservation*). Posisi layar, variabel form, dan alur aplikasi pengguna tidak tereset, sehingga iterasi pengembangan antarmuka berlangsung dalam hitungan milidetik.

Perbedaan dengan hot restart:
Hot restart memusnahkan seluruh objek state yang sedang berjalan di memori dan menginisialisasi ulang seluruh aplikasi dari fungsi `main()`. Aplikasi kembali ke layar awal seperti saat pertama kali diluncurkan, namun proses kompilasinya tetap jauh lebih cepat dibandingkan kompilasi penuh (*full restart* atau *rebuild binary*).

Kapan harus melakukan hot restart atau full restart:
- Situasi yang memerlukan hot restart:
  1. Perubahan logika pada fungsi `main()` atau inisialisasi awal aplikasi.
  2. Perubahan pada variabel statis (*static fields*) atau variabel global.
  3. Perubahan pada metode inisialisasi siklus hidup seperti `initState()` pada `StatefulWidget`.
  4. Mengubah struktur tipe widget (misalnya mengubah `StatelessWidget` menjadi `StatefulWidget` atau sebaliknya).
- Situasi yang memerlukan full restart (stop dan jalankan ulang):
  1. Penambahan dependensi paket baru atau aset (gambar/font) pada `pubspec.yaml`.
  2. Perubahan kode native pada platform Android (`android/`), iOS (`ios/`), atau Windows/macOS/Linux.
  3. Modifikasi konfigurasi build native (seperti `AndroidManifest.xml` atau `build.gradle`).

## Progress Mingguan

Progres pengembangan proyek aplikasi mobile portofolio pribadi berdasarkan riwayat commit dan rincian pengerjaan tugas:

### Minggu 7 - Tugas 7: Basic Flutter, Modular Widgets & Interaktivitas
- Inisialisasi Proyek: Pembuatan kerangka kerja proyek Flutter `myportofolio_mobile` dan konfigurasi `MaterialApp` berbasis tema Material 3.
- Pemisahan Kode Modular: Pemisahan berkas bootstrap `lib/main.dart` dan tampilan halaman utama `lib/menu.dart` untuk menjaga prinsip *separation of concerns*.
- Implementasi Widget Kustom:
  - Membuat model data `ItemHomepage` yang efisien dengan warna modular.
  - Membangun komponen presentasional `InfoCard` untuk menyajikan NPM, Nama, dan Kelas pengembang secara sejajar.
  - Membangun komponen interaktif `ItemCard` dalam tata letak `GridView` 3 kolom untuk tombol aksi (Lihat Proyek, Tambah Proyek, Logout) dengan warna latar belakang yang berbeda (`Colors.blue`, `Colors.green`, `Colors.red`).
- Aspek Kreativitas (*Custom SnackBar*): Mengimplementasikan `SnackBar` responsif yang menyesuaikan warna kartu, dilengkapi ikon dan tombol aksi `SnackBarAction` untuk menutup pesan.
- Pengujian & Analisis Kode: Menulis dan memperbarui skenario uji pada `test/widget_test.dart` dan memastikan kelulusan analisis statis `flutter analyze` (*No issues found!*).
- Dokumentasi & Refleksi: Menuliskan jawaban pertanyaan reflektif Tugas 7 serta pengungkapan AI pada `README.md`.

## AI Disclosure

- Tools AI yang Digunakan: Google Gemini / Antigravity AI Assistant
- Link Percakapan / Log AI: [https://share.gemini.google/Jf6VI5dbcuxF](https://share.gemini.google/Jf6VI5dbcuxF)
- Ringkasan Bantuan AI:
  - Memberikan penjelasan konseptual awal untuk pertanyaan reflektif seputar arsitektur Flutter (widget tree, constraints, BuildContext, siklus hot reload vs hot restart).
  - Membantu validasi struktur awal model `ItemHomepage` dan refaktor `const constructor`.
  - Membantu menyusun draf awal dokumentasi proyek dan penyelarasan struktur dengan repositori web.

- Analisis Kritis Keterbatasan AI:
  - Warna kartu tombol yang seragam: Kode awal yang disarankan AI menggunakan warna sekunder tema secara statis (`Theme.of(context).colorScheme.secondary`), sehingga ketiga tombol memiliki warna latar yang sama tanpa diferensiasi visual.
  - Kegagalan uji otomatis bawaan: Template `test/widget_test.dart` bawaan masih menguji counter default Flutter dan data profil lama contoh tutorial, yang menyebabkan kegagalan uji (*test failure*).
  - Komentar yang redundan: AI kerap menyisipkan komentar naratif yang panjang dan mengulang hal yang sudah jelas dari kode pada setiap widget.

- Perbaikan Manual yang Dilakukan:
  - Menambahkan atribut `final Color color;` pada model `ItemHomepage` dan menetapkan warna yang berbeda dan kontras (`Colors.blue`, `Colors.green`, `Colors.red`) pada masing-masing item.
  - Mengintegrasikan warna modular ke widget `Material` di `ItemCard` serta merancang *Custom SnackBar* interaktif dengan `Row`, ikon representatif, dan tombol `SnackBarAction`.
  - Memperbarui skenario pengujian di `test/widget_test.dart` agar mencari "M. Naufal Abyaz Bawono" dan memverifikasi keberadaan tombol menu, mencapai kelulusan tes 100%.
  - Menyederhanakan seluruh komentar kode menjadi komentar satu baris (`//`) yang bersih dan esensial sesuai prinsip *clean code*.

## Kontak
- Nama: M Naufal Abyaz Bawono
- NPM: 2506656993
- GitHub: [github.com/Abyaz1](https://github.com/Abyaz1/)
- LinkedIn: [linkedin.com/in/abyaz](https://linkedin.com/in/abyaz)
