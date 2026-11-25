import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/experience_form.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/screens/project_list_screen.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';

// Model data untuk kartu menu aksi pada halaman utama
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  const ItemHomepage(this.name, this.icon, this.color);
}

// Widget kartu menu aksi portofolio
class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        // Menangani aksi tap pada kartu menu aksi
        onTap: () async {
          // Menampilkan custom SnackBar interaktif saat kartu ditekan
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                backgroundColor: item.color,
                content: Row(
                  children: [
                    Icon(item.icon, color: Colors.white),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text("Kamu telah menekan tombol ${item.name}!"),
                    ),
                  ],
                ),
                action: SnackBarAction(
                  label: 'Tutup',
                  textColor: Colors.white,
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
              ),
            );

          // Navigasi ke halaman daftar proyek publik
          if (item.name == "Lihat Proyek") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProjectListScreen(),
              ),
            );
          }

          // Navigasi ke halaman tambah proyek setelah verifikasi login
          if (item.name == "Tambah Proyek") {
            final ok = await ensureLoggedIn(context);
            if (!context.mounted || !ok) return;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProjectFormPage()),
            );
          }

          // Navigasi ke halaman formulir tambah pengalaman
          if (item.name == "Tambah Pengalaman") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ExperienceFormPage(),
              ),
            );
          }

          // Menangani aksi logout ketika pengguna menekan kartu Logout
          if (item.name == "Logout") {
            final auth = context.read<AuthState>();
            if (!auth.isLoggedIn) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text("Anda belum login."),
                    backgroundColor: Colors.orange,
                  ),
                );
              return;
            }
            await auth.logout();
            if (!context.mounted) return;
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text("Logout berhasil!"),
                  backgroundColor: Colors.green,
                ),
              );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white, size: 30.0),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
