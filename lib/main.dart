import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sekolahku/hive/student_model.dart';
import 'package:sekolahku/page/home_page.dart';

late Box box;

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(StudentModelAdapter());
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.openBox('studentbox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SekolahKu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'SekolahKu'),
    );
  }
}


