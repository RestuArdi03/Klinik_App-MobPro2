import 'package:flutter/material.dart';
import '../service/poli_service.dart';
import '../model/poli.dart';
import 'poli_page.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({Key? key}) : super(key: key);
  _PoliFormState createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Poli')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [_fieldNamaPoli(), SizedBox(height: 20), _tombolSimpan()],
          ),
        ),
      ),
    );
  }

  _fieldNamaPoli() {
    return TextField(
      decoration: const InputDecoration(labelText: 'Nama Poli'),
      controller: _namaPoliCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        Poli poli = new Poli(namaPoli: _namaPoliCtrl.text);
        await PoliService().simpan(poli).then((value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PoliPage(),
            ), //ada sedikit yang diubah di bagian routenya yang sebelumnya MaterialPageRoute(builder: (context) => PoliDetail(poli: value))); yang dimana ini mengarah ke halaman Detail Poli akhirnya saya ubah agar mengarah ke halaman Data Poli
          );
        });
      },
      child: const Text('Simpan'),
    );
  }
}
