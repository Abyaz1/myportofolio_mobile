import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/menu.dart';

// Fungsi utama bootstrap aplikasi Flutter
void main() {
  runApp(const MyApp());
}

// Root widget konfigurasi tema dan navigasi aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyPortfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          secondary: Colors.amber[700],
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
