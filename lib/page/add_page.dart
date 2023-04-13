import 'package:flutter/material.dart';

class AddSiswaPage extends StatefulWidget {
  const AddSiswaPage({super.key});

  @override
  State<AddSiswaPage> createState() => _AddSiswaPageState();
}

enum Gender { male, female }

class _AddSiswaPageState extends State<AddSiswaPage> {
  Gender? _selectedGender;
  String? _selectedItem;

  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buat Siswa"),
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          children: [
            Row(
              children: const [
                Flexible(
                    child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama Depan',
                  ),
                )),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                    child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama Belakang',
                  ),
                )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Flexible(
                child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nama Depan',
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            const Text("jenis Kelamin"),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio<Gender>(
                  value: Gender.male,
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                const Text('Pria'),
                Radio<Gender>(
                  value: Gender.female,
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                const Text('Wanita'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButton<String>(
              hint: Text("Pilih Jenjang"),
              value: _selectedItem ?? null,
              items: const [
                DropdownMenuItem<String>(
                  value: 'Item 1',
                  child: Text('Item 1'),
                ),
                DropdownMenuItem<String>(
                  value: 'Item 2',
                  child: Text('Item 2'),
                ),
                DropdownMenuItem<String>(
                  value: 'Item 3',
                  child: Text('Item 3'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedItem = value!;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Hobi"),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Checkbox(
                  value: _checkbox1,
                  onChanged: (newValue) {
                    setState(() {
                      _checkbox1 = newValue!;
                    });
                  },
                ),
                Text('Checkbox 1'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _checkbox2,
                  onChanged: (newValue) {
                    setState(() {
                      _checkbox2 = newValue!;
                    });
                  },
                ),
                Text('Checkbox 2'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _checkbox3,
                  onChanged: (newValue) {
                    setState(() {
                      _checkbox3 = newValue!;
                    });
                  },
                ),
                Text('Checkbox 3'),
              ],
            ),
            TextField(
              maxLines: 5,
              onChanged: (value) {
                setState(() {
                  // _text = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Alamat',
                border: OutlineInputBorder(),
              ),
            )
          ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.save),
      ),
    );
  }
}
