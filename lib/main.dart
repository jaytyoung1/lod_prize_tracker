import 'package:flutter/material.dart';
import 'package:lod_prize_tracker/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: const Key('lod_material_app'),
      debugShowCheckedModeBanner: false,
      title: 'LoD Prize Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'LoD Prize Tracker'),
    );
  }
}
