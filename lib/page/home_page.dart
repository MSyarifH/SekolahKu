import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sekolahku/hive/student_model.dart';
import 'package:sekolahku/page/profile_detail_page.dart';

import 'add_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        title: Text(widget.title),
        // actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Center(
          child: ValueListenableBuilder<Box>(
        valueListenable: studentbox.listenable(),
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              StudentModel student = value.getAt(index);
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailSiswaPage(
                      student: student,
                      studentIndex: index,
                    );
                  }));
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: CircleAvatar(
                                  radius: 30,
                                  child: student.gender == "Gender.male"
                                      ? Image.asset('assets/images/pria.png')
                                      : Image.asset(
                                          'assets/images/wanita.png')),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${student.firstName} ${student.lastName}"),
                                    Text(student.gender == "Gender.male"
                                        ? "Pria"
                                        : "Wanita")
                                  ],
                                )),
                            Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(student.school),
                                    Text(student.phoneNumber)
                                  ],
                                )),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddSiswaPage(
              isEdit: false,
              student: null,
              indexStudent: null,
            );
          }));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
