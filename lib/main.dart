import 'package:flutter/material.dart';
import 'package:thaiapp/screens/home/home_screen.dart';
import 'package:thaiapp/screens/job_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thai Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 11, 36, 71),
        secondaryHeaderColor: const Color.fromARGB(255, 25, 55, 109),
        highlightColor: const Color.fromARGB(255, 87, 108, 188),
        hintColor: const Color.fromARGB(255, 165, 215, 232),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
