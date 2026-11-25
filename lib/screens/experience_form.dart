import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

// Halaman formulir penambahan pengalaman baru
class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

// State untuk halaman formulir pengalaman
class _ExperienceFormPageState extends State<ExperienceFormPage> {
  // Kunci form untuk validasi dan manajemen state form
  final _formKey = GlobalKey<FormState>();

  // Variabel penampung nilai input formulir
  String _position = "";
  String _company = "";
  String _experienceType = "Magang (Internship)";
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isCurrent = false;
  String _description = "";

  // Kontroler teks untuk menampilkan tanggal terpilih
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  // Daftar opsi jenis pengalaman portofolio
  final List<String> _types = const [
    'Magang (Internship)',
    'Pekerjaan Penuh Waktu',
    'Pekerjaan Paruh Waktu',
    'Organisasi Mahasiswa',
    'Kepanitiaan',
  ];

  // Fungsi pembantu untuk memformat tanggal ke format DD/MM/YYYY
  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  // Fungsi untuk memilih tanggal mulai melalui date picker
  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _startDate = picked;
        _startDateController.text = _formatDate(picked);
      });
    }
  }

  // Fungsi untuk memilih tanggal selesai melalui date picker
  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? (_startDate ?? DateTime.now()),
      firstDate: _startDate ?? DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _endDate = picked;
        _endDateController.text = _formatDate(picked);
      });
    }
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan gaya visual konsisten tema indigo
      appBar: AppBar(
        title: const Center(child: Text('Add Experience Form')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      // Drawer navigasi samping aplikasi
      drawer: const LeftDrawer(),
      // Body formulir yang dapat digulir pada layar sempit
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input posisi atau jabatan pekerjaan
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Software Engineer Intern",
                    labelText: "Posisi / Jabatan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _position = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Posisi / jabatan tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              // Input nama institusi atau perusahaan
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: PT Teknologi Indonesia",
                    labelText: "Instansi / Perusahaan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _company = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama instansi / perusahaan tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              // Dropdown pilihan tipe pengalaman
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Tipe Pengalaman",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _experienceType,
                  items: _types
                      .map(
                        (type) =>
                            DropdownMenuItem(value: type, child: Text(type)),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _experienceType = newValue!;
                    });
                  },
                ),
              ),
              // Pilihan tanggal mulai dengan showDatePicker
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _startDateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Tanggal Mulai",
                    hintText: "Pilih tanggal mulai",
                    suffixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onTap: () => _selectStartDate(context),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Tanggal mulai tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              // Switch untuk menentukan apakah pengalaman masih aktif berjalan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SwitchListTile(
                  title: const Text("Masih Berjalan (Currently Working Here)"),
                  value: _isCurrent,
                  onChanged: (bool value) {
                    setState(() {
                      _isCurrent = value;
                      if (_isCurrent) {
                        _endDate = null;
                        _endDateController.text = "Sekarang (Present)";
                      } else {
                        _endDateController.clear();
                      }
                    });
                  },
                ),
              ),
              // Pilihan tanggal selesai jika posisi sudah berakhir
              if (!_isCurrent)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _endDateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "Tanggal Selesai",
                      hintText: "Pilih tanggal selesai",
                      suffixIcon: const Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onTap: () => _selectEndDate(context),
                    validator: (String? value) {
                      if (!_isCurrent) {
                        if (value == null || value.trim().isEmpty) {
                          return "Tanggal selesai tidak boleh kosong!";
                        }
                        if (_startDate != null &&
                            _endDate != null &&
                            _endDate!.isBefore(_startDate!)) {
                          return "Tanggal selesai tidak boleh mendahului tanggal mulai!";
                        }
                      }
                      return null;
                    },
                  ),
                ),
              // Input deskripsi tanggung jawab dan pencapaian
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText:
                        "Deskripsikan tanggung jawab utama dan pencapaian",
                    labelText: "Deskripsi Pengalaman",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Deskripsi pengalaman tidak boleh kosong!";
                    }
                    if (value.trim().length < 10) {
                      return "Deskripsi minimal berisi 10 karakter!";
                    }
                    return null;
                  },
                ),
              ),
              // Tombol simpan untuk memvalidasi dan memunculkan notifikasi serta dialog
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Memunculkan notifikasi SnackBar berhasil disimpan
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Pengalaman baru berhasil disimpan!",
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );

                        final String endDisplay = _isCurrent
                            ? "Sekarang (Present)"
                            : (_endDate != null ? _formatDate(_endDate!) : "-");

                        // Menampilkan ringkasan isian formulir dalam AlertDialog
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                'Pengalaman berhasil ditambahkan!',
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Posisi: $_position'),
                                    Text('Instansi: $_company'),
                                    Text('Tipe: $_experienceType'),
                                    Text(
                                      'Mulai: ${_startDate != null ? _formatDate(_startDate!) : "-"}',
                                    ),
                                    Text('Selesai: $endDisplay'),
                                    Text('Deskripsi: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                    setState(() {
                                      _startDate = null;
                                      _endDate = null;
                                      _isCurrent = false;
                                      _startDateController.clear();
                                      _endDateController.clear();
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        // Memunculkan notifikasi SnackBar peringatan jika form tidak valid
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Terdapat isian yang belum valid, mohon periksa kembali!",
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
