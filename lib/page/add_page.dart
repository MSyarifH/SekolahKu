import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sekolahku/hive/student_model.dart';
import 'package:sekolahku/page/home_page.dart';

class AddSiswaPage extends StatefulWidget {
  final bool isEdit;
  final int? indexStudent;
  final StudentModel? student;

  const AddSiswaPage(
      {super.key,
      required this.isEdit,
      required this.student,
      required this.indexStudent});

  @override
  State<AddSiswaPage> createState() => _AddSiswaPageState();
}

enum Gender { male, female }

class _AddSiswaPageState extends State<AddSiswaPage> {
  Gender? _selectedGender;
  String? _jenjang;
  final TextEditingController _namaDepan = TextEditingController();
  final TextEditingController _namaBelakang = TextEditingController();
  final TextEditingController _noHP = TextEditingController();
  final TextEditingController _alamat = TextEditingController();

  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;

  String getCheckboxValue() {
    String value = '';
    if (_checkbox1) {
      value += 'membaca,';
    }
    if (_checkbox2) {
      value += 'menulis,';
    }
    if (_checkbox3) {
      value += 'menggambar';
    }

    value = value.replaceAll(RegExp(r',+$'), '');
    return value;
  }

  saveStudent({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String gender,
    required String school,
    required String hobby,
    required String address,
  }) async {
    Box box = await Hive.openBox('studentbox');
    if (!widget.isEdit) {
      box.add(StudentModel(
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          gender: gender,
          school: school,
          hobby: hobby,
          address: address));
    } else {
      box.putAt(
          widget.indexStudent!,
          StudentModel(
              firstName: firstName,
              lastName: lastName,
              phoneNumber: phoneNumber,
              gender: gender,
              school: school,
              hobby: hobby,
              address: address));
    }
  }

  fromEdit(bool edit) {
    if (!edit) {
      return;
    } else {
      setState(() {
        _namaDepan.text = widget.student!.firstName;
        _namaBelakang.text = widget.student!.lastName;
        _noHP.text = widget.student!.phoneNumber;
        _alamat.text = widget.student!.address;
        _jenjang = widget.student!.school;
        Gender f = Gender.values
            .firstWhere((e) => e.toString() == widget.student!.gender);
        _selectedGender = f;

        String hobbies = widget.student!.hobby;
        List<String> hobbyList = hobbies.split(',');

        _checkbox1 = (hobbyList.contains('membaca'));
        _checkbox2 = (hobbyList.contains('menulis'));
        _checkbox3 = (hobbyList.contains('menggambar'));
      });
    }
  }

  @override
  void initState() {
    fromEdit(widget.isEdit);
    super.initState();
  }

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
              children: [
                Flexible(
                    child: TextField(
                  controller: _namaDepan,
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
                  controller: _namaBelakang,
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

            // nomor HP + validation
            Flexible(
                child: TextField(
              controller: _noHP,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nomor HP',
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
            //pilih jenjang
            //sdsmpsmasmks1
            DropdownButton<String>(
              hint: Text("Pilih Jenjang"),
              value: _jenjang ?? null,
              items: const [
                DropdownMenuItem<String>(
                  value: 'sd',
                  child: Text('sd'),
                ),
                DropdownMenuItem<String>(
                  value: 'smp',
                  child: Text('smp'),
                ),
                DropdownMenuItem<String>(
                  value: 'sma',
                  child: Text('sma'),
                ),
                DropdownMenuItem<String>(
                  value: 'smk',
                  child: Text('smk'),
                ),
                DropdownMenuItem<String>(
                  value: 's1',
                  child: Text('s1'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _jenjang = value!;
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
                Text('Membaca'),
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
                Text('Menulis'),
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
                Text('Menggambar'),
              ],
            ),
            TextField(
              controller: _alamat,
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
          String checkboxValue = getCheckboxValue();
          saveStudent(
            firstName: _namaDepan.text,
            lastName: _namaBelakang.text,
            phoneNumber: _noHP.text,
            address: _alamat.text,
            gender: _selectedGender.toString(),
            school: _jenjang.toString(),
            hobby: checkboxValue,
          );
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return const MyHomePage(title: "SekolahKu");
            },
          ));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.save),
      ),
    );
  }
}
