import 'package:flutter/material.dart';
import 'package:sekolahku/page/profile_detail_page.dart';

import 'add_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Center(
          child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DetailSiswaPage();
              }));
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: CircleAvatar(radius: 30),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [Text("Nama Saya"), Text("JK")],
                            )),
                        Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [Text("SMA"), Text("123123")],
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
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddSiswaPage();
          }));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
