import 'package:flutter/material.dart';

class DetailSiswaPage extends StatefulWidget {
  const DetailSiswaPage({super.key});

  @override
  State<DetailSiswaPage> createState() => _DetailSiswaPageState();
}

enum Gender { male, female }

class _DetailSiswaPageState extends State<DetailSiswaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Siswa"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
        ],
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          children: [
            const CircleAvatar(radius: 70),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: const Icon(Icons.account_box),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Jhon wick",style: TextStyle(fontSize: 18),),
                    Text("Nama"),
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
                Container(
                  child: const Icon(Icons.phone),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("123123",style: TextStyle(fontSize: 18),),
                    Text("No. Hp"),
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
                Container(
                  child: const Icon(Icons.label),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Pria",style: TextStyle(fontSize: 18),),

                    Text("Jenis Kelamin"),
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
                Container(
                  child: const Icon(Icons.school),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("SMA",style: TextStyle(fontSize: 18),),

                    Text("Jenjang"),
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
                Container(
                  child: const Icon(Icons.location_on),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Jl jalan",style: TextStyle(fontSize: 18),),

                    Text("Alamat"),
                  ],
                )
              ],
            ),
          ]),
    );
  }
}
