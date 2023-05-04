import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../hive/student_model.dart';
import 'add_page.dart';

class DetailSiswaPage extends StatefulWidget {
  final StudentModel student;
  final int studentIndex;

  const DetailSiswaPage(
      {super.key, required this.student, required this.studentIndex});

  @override
  State<DetailSiswaPage> createState() => _DetailSiswaPageState();
}

class _DetailSiswaPageState extends State<DetailSiswaPage> {
  late Box studentbox;

  @override
  void initState() {
    studentbox = Hive.box("studentbox");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Siswa"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return  AddSiswaPage(
                    isEdit: true,
                    student: widget.student,
                    indexStudent: widget.studentIndex,
                  );
                }));
              },
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                studentbox.deleteAt(widget.studentIndex);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete)),
        ],
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          children: [
            CircleAvatar(
                radius: 70,
                child: widget.student.gender == "Gender.male"
                    ? Image.asset('assets/images/pria.png')
                    : Image.asset('assets/images/wanita.png')),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.account_box),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.student.firstName} ${widget.student.lastName}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Text("Nama"),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.phone),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.student.phoneNumber,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Text("No. Hp"),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.label),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.student.gender == "Gender.male"
                          ? "Pria"
                          : "Wanita",
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Text("Jenis Kelamin"),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.school),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.student.school,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Text("Jenjang"),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.location_on),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.student.address,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Text("Alamat"),
                  ],
                )
              ],
            ),
          ]),
    );
  }
}
