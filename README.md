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
- [Tugas 8](#tugas-8)
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
   - Tambah Proyek: Tombol dengan latar belakang hijau (`Colors.green`) dan ikon tambah untuk membuka formulir proyek baru.
   - Tambah Pengalaman: Tombol dengan latar belakang oranye (`Colors.orange`) dan ikon tas kerja untuk membuka formulir pengalaman baru.
   - Logout: Tombol dengan latar belakang merah (`Colors.red`) dan ikon keluar.
3. Drawer Navigasi Samping (`LeftDrawer`):
   Menyediakan menu samping global yang konsisten di setiap halaman untuk berpindah antara halaman utama (Home), formulir tambah proyek (Add Project), dan formulir tambah pengalaman (Add Experience).
4. Formulir Tambah Proyek (`ProjectFormPage`):
   Formulir input data proyek baru dengan field nama proyek, deskripsi (*multiline*), kategori (*dropdown*), teknologi, dan URL tautan proyek, lengkap dengan validasi dan pop-up dialog ringkasan.
5. Formulir Tambah Pengalaman Baru (`ExperienceFormPage`):
   Formulir input data riwayat pengalaman kerja atau organisasi dengan field posisi, instansi/perusahaan, tipe pengalaman (*dropdown*), pemilih tanggal interaktif (`showDatePicker()`), sakelar (*switch*) status "Masih Berjalan", serta deskripsi tanggung jawab, lengkap dengan validasi ketat dan pop-up dialog ringkasan data.
6. Aspek Kreativitas & Peningkatan Interaktivitas:
   - `Custom SnackBar`: Responsif dengan warna latar belakang selaras kartu tombol, ikon representatif, dan tombol aksi `SnackBarAction(label: 'Tutup')`.
   - Interaktivitas Formulir Pengalaman: Integrasi pemilih tanggal (`showDatePicker()`), sakelar dinamis "Masih Berjalan" yang otomatis menonaktifkan input tanggal selesai dan menggantinya dengan "Sekarang (Present)", serta validasi urutan kronologi tanggal.
7. Struktur Kode Modular & Bersih:
   - Pemisahan berkas halaman ke direktori `lib/screens/` dan komponen widget ke direktori `lib/widgets/`.
   - Seluruh komentar dalam kode ditulis secara rapi menggunakan komentar satu baris (`//`).
   - Lulus analisis statis `flutter analyze` dengan status *No issues found!*.

## Struktur Direktori

```text
myportofolio_mobile/
├── android/                 # Konfigurasi dan berkas build native platform Android
├── ios/                     # Konfigurasi dan berkas build native platform iOS
├── lib/
│   ├── main.dart            # Entry point aplikasi & konfigurasi tema global
│   ├── screens/             # Halaman-halaman aplikasi
│   │   ├── menu.dart        # Halaman utama portofolio (MyHomePage & InfoCard)
│   │   ├── project_form.dart # Halaman formulir input proyek baru
│   │   └── experience_form.dart # Halaman formulir input riwayat pengalaman baru
│   └── widgets/             # Komponen widget modular & reusable
│       ├── left_drawer.dart # Menu drawer navigasi samping aplikasi
│       └── project_card.dart # Model ItemHomepage & widget ItemCard
├── test/
│   └── widget_test.dart     # Berkas pengujian otomatis widget Flutter
├── pubspec.yaml             # Manajemen dependensi pustaka, font, dan aset
└── README.md                # Dokumentasi proyek & laporan refleksi tugas
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

## Tugas 8

### 1. Jelaskan perbedaan antara `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()`. Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama.

Perbedaan metode navigasi:
- `Navigator.push()`: Menumpuk route baru di atas route yang sedang aktif (stack bertambah). Route lama dipertahankan di bawahnya sehingga pengguna dapat kembali dengan tombol *back*.
- `Navigator.pushReplacement()`: Menghapus route yang sedang aktif dan menggantikannya dengan route baru, mencegah tombol *back* kembali ke layar sebelumnya.
- `Navigator.pop()`: Mengeluarkan route teratas untuk kembali ke layar sebelumnya dalam stack (seperti menutup drawer atau dialog).

Penerapan pada kartu aksi & drawer:
- Pada kartu aksi (`ItemCard`), digunakan `Navigator.push()` agar pengguna dapat kembali ke halaman utama sewaktu-waktu menggunakan tombol *back*.
- Pada opsi Home di widget `LeftDrawer`, digunakan `Navigator.pushReplacement()` menuju `MyHomePage` untuk membuang halaman formulir aktif dan mencegah terjadinya penumpukan halaman berulang (*infinite stack*) di memori.

### 2. Bagaimana susunan Scaffold, AppBar, dan Drawer membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.

Konsistensi tata letak:
`Scaffold` menyediakan kerangka struktur layout standar Material Design, `AppBar` menyajikan bilah atas yang seragam dengan tombol menu drawer, dan `LeftDrawer` dipasang sebagai komponen navigasi modular di setiap halaman (`menu.dart`, `project_form.dart`, `experience_form.dart`) untuk menjamin konsistensi navigasi di seluruh aplikasi.

Penerapan warna tema:
Warna tema primer (`Colors.indigo`) digunakan konsisten pada:
1. Latar belakang `AppBar` di seluruh halaman.
2. Dekorasi latar belakang `DrawerHeader` pada `LeftDrawer`.
3. Tombol aksi Simpan (`ElevatedButton`) pada formulir proyek dan pengalaman.

### 3. Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.

Alasan tata letak:
Formulir menggunakan kombinasi `SingleChildScrollView` -> `Form` -> `Column` karena susunan linier vertikal ini paling ergonomis dan teratur untuk pengisian data bertahap dari atas ke bawah pada layar ponsel.
- Peran pengatur jarak: `Padding` dan `SizedBox` memberi ruang kosong dan pembatas jarak yang proporsional antar-elemen input agar tidak berdempetan atau menempel ke tepi layar.
- Peran widget penggulir: `SingleChildScrollView` membuat area formulir dapat digulir, sehingga mencegah galat *RenderFlex overflowed* saat ruang layar menyempit akibat kemunculan keyboard virtual (*soft keyboard*).

### 4. Apa peran GlobalKey<FormState>, validator, dan validate() saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.

Mekanisme validasi form:
- `GlobalKey<FormState>`: Kunci unik untuk mengakses dan mengelola *state* internal dari widget `Form`.
- `validator`: Fungsi logika pada tiap field yang memeriksa validitas nilai input dan mengembalikan pesan kesalahan jika data tidak sesuai.
- `validate()`: Metode yang dipanggil lewat `_formKey.currentState!.validate()`. Saat tombol Simpan ditekan, metode ini menjalankan seluruh callback validator secara bersamaan, menampilkan pesan error jika ada yang tidak sah (mengembalikan `false`), dan mengembalikan `true` jika seluruh isian valid.

Contoh nilai ditolak & batasan tipe keyboard:
- Nilai ditolak: Input hanya spasi `"   "` ditolak dengan validasi `value.trim().isEmpty`, deskripsi kurang dari 10 karakter, serta tanggal selesai yang mendahului tanggal mulai.
- Batasan keyboard: Jenis keyboard hanya memberikan petunjuk tampilan antarmuka (*input hint*), tetapi tidak dapat memvalidasi field kosong, mencegah *paste* teks dari clipboard, maupun memeriksa logika bisnis. Oleh karena itu, validasi programatik tetap wajib digunakan.

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

### Minggu 8 - Tutorial 09 & Tugas 8: Navigation, Layouts, Forms, and Input Elements
- Mereorganisasi arsitektur proyek ke direktori modular `lib/screens/` dan `lib/widgets/`.
- Membangun drawer navigasi `LeftDrawer` dengan routing `pushReplacement` ke halaman Home, Add Project, dan Add Experience.
- Membuat formulir input proyek (`ProjectFormPage`) dan formulir pengalaman baru (`ExperienceFormPage`) lengkap dengan pemilih tanggal (`showDatePicker()`), sakelar status aktif, validasi menyeluruh, serta pop-up `AlertDialog`.
- Menambahkan kartu aksi baru pada menu utama, menerapkan navigasi `Navigator.push()`, dan menambahkan pembungkus `SingleChildScrollView` untuk mencegah *overflow*.
- Memastikan kode lulus uji analisis statis `flutter analyze` dan lulus pengujian `flutter test` 100%.

## AI Disclosure

- Tools AI yang Digunakan: Google Gemini / Antigravity AI Assistant
- Link Percakapan / Log AI: [https://share.gemini.google/Jf6VI5dbcuxF](https://share.gemini.google/Jf6VI5dbcuxF)
- Ringkasan Bantuan AI:
  - Memberikan penjelasan konseptual untuk pertanyaan reflektif seputar arsitektur navigasi Flutter (`Navigator.push`, `pushReplacement`, `pop`), layout form, dan mekanisme `GlobalKey<FormState>`.
  - Membantu perancangan struktur awal formulir `ExperienceFormPage` beserta integrasi `showDatePicker()`.

- Analisis Kritis Keterbatasan AI:
  - Ketiadaan perlindungan overflow pada halaman menu utama: Penambahan kartu aksi ke-4 pada `GridView` di dalam `Column` tanpa pembungkus `SingleChildScrollView` memicu galat layout `RenderFlex overflowed` saat pengujian widget dijalankan.
  - Validasi input yang kurang menyeluruh: Saran form awal dari AI hanya memeriksa apakah string tidak kosong (`value.isEmpty`), tanpa mendeteksi string yang hanya terdiri dari karakter spasi (*whitespace*).
  - Penanganan tanggal selesai: Kode awal AI tidak memvalidasi urutan kronologi tanggal, memungkinkan tanggal selesai dipilih lebih lampau dari tanggal mulai.

- Perbaikan Manual yang Dilakukan:
  - Memperbaiki tata letak halaman utama di `lib/screens/menu.dart` dengan membungkus `body` menggunakan `SingleChildScrollView` dan mengatur `NeverScrollableScrollPhysics` pada `GridView`, sehingga mengeliminasi galat overflow sepenuhnya.
  - Menambahkan sanitasi string `value.trim().isEmpty` pada seluruh validator untuk menolak input kosong berspasi.
  - Mengembangkan logika validasi perbandingan tanggal `_endDate!.isBefore(_startDate!)` pada pemilih tanggal selesai di `ExperienceFormPage`.
  - Menambahkan fitur UI/UX interaktif berupa `SwitchListTile` "Masih Berjalan" untuk mengelola kondisi pekerjaan aktif secara dinamis.
  - Menyeragamkan seluruh komentar kode menjadi komentar satu baris (`//`) sesuai prinsip clean code.

## Kontak
- Nama: M Naufal Abyaz Bawono
- NPM: 2506656993
- GitHub: [github.com/Abyaz1](https://github.com/Abyaz1/)
- LinkedIn: [linkedin.com/in/abyaz](https://linkedin.com/in/abyaz)
