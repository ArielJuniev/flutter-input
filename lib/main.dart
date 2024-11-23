import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Widget utama yang membangun aplikasi
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APLIKASI INPUT DATA DIRI',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Tema aplikasi
      ),
      home: InputScreen(), // Menentukan layar awal aplikasi
    );
  }
}

// Widget untuk input NIM dan nama
class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

// State untuk InputScreen
class _InputScreenState extends State<InputScreen> {
  // Kontroler untuk TextField
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ttlController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();

  // Variabel untuk menyimpan teks yang akan ditampilkan
  String _displayText = '';

  // Fungsi untuk mengolah data saat tombol submit ditekan
  void _submitData() {
    final nim = _nimController.text; // Ambil NIM dari kontroler
    final name = _nameController.text; // Ambil nama dari kontroler
    final ttl = _ttlController.text; // Ambil nama dari kontroler
    final alamat = _alamatController.text; // Ambil nama dari kontroler

    // Memperbarui tampilan dengan data yang dimasukkan
    setState(() {
      _displayText =
          'NIM: $nim\nNama: $name\nTtl: $ttl\nAlamat: $alamat'; // Set teks untuk ditampilkan
    });

    // Mengosongkan input setelah submit
    _nimController.clear();
    _nameController.clear();
    _ttlController.clear();
    _alamatController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APLIKASI INPUT DATA DIRI'), // Judul aplikasi
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding di sekitar body
        child: Column(
          children: [
            TextField(
              controller: _nimController, // Mengaitkan kontroler
              decoration: InputDecoration(labelText: 'NIM'), // Label input
              keyboardType: TextInputType.number, // Tipe keyboard untuk angka
            ),
            TextField(
              controller: _nameController, // Mengaitkan kontroler
              decoration: InputDecoration(labelText: 'Nama'), // Label input
            ),
            TextField(
              controller: _ttlController, // Mengaitkan kontroler
              decoration: InputDecoration(labelText: 'Ttl'), // Label input
            ),
            TextField(
              controller: _alamatController, // Mengaitkan kontroler
              decoration: InputDecoration(labelText: 'Alamat '), // Label input
            ),
            SizedBox(height: 20), // Spasi vertikal
            ElevatedButton(
              onPressed:
                  _submitData, // Fungsi yang dipanggil saat tombol ditekan
              child: Text('Submit'), // Teks pada tombol
            ),
            SizedBox(height: 20), // Spasi vertikal
            Text(
              _displayText, // Menampilkan hasil input
              style: TextStyle(fontSize: 20), // Ukuran teks
            ),
          ],
        ),
      ),
    );
  }
}
