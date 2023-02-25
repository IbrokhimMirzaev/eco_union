import 'package:eco_union/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initializing Firebase
  await Firebase.initializeApp();

  // Setting portrait view on app && white status bar
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    ),
  );
}
