import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/project.dart';

// Halaman detail proyek yang menampilkan informasi lengkap satu proyek
class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menampilkan gambar proyek jika URL gambar tersedia
            if (project.projectImageUrl.isNotEmpty) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  project.projectImageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox.shrink();
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
            // Judul proyek
            Text(
              project.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Teknologi yang digunakan
            Chip(label: Text(project.techStack)),
            const SizedBox(height: 16),
            // Deskripsi proyek
            const Text(
              'Deskripsi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(project.description, style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 16),
            // Tautan proyek
            const Text(
              'Tautan Proyek',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              project.projectUrl,
              style: const TextStyle(fontSize: 15, color: Colors.indigo),
            ),
          ],
        ),
      ),
    );
  }
}
