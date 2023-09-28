import 'package:flutter/material.dart';
import 'package:thaiapp/screens/home/home_screen.dart';
import 'package:thaiapp/screens/loginorreg.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: LoginOrReg(showLoginPage: false),
    );
  }
}
