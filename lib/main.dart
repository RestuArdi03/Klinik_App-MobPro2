import 'package:flutter/material.dart';
import './helpers/user_info.dart';
import './ui/beranda.dart';
import './ui/login.dart';

Future<void> main() async {
  // Wajib dipanggil sebelum mengeksekusi kode async di main (seperti SharedPreferences)
  WidgetsFlutterBinding.ensureInitialized();

  // Memeriksa token login secara async
  var token = await UserInfo().getToken();
  print(token);

  runApp(
    MaterialApp(
      title: "Klinik APP",
      debugShowCheckedModeBanner: false,

      // --- Tema yang Anda kustomisasi tetap dipertahankan di sini ---
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          primary: Colors.teal,
        ),
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16.0, color: Colors.black87),
        ),
      ),

      // Logika penentuan halaman awal berdasarkan token
      home: token == null ? const Login() : const Beranda(),
    ),
  );
}
