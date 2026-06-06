import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const PosterNovaApp());
}

class PosterNovaApp extends StatelessWidget {
  const PosterNovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PosterNova',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PosterNova'),
        ),
        body: const Center(
          child: Text('Welcome to PosterNova'),
        ),
      ),
    );
  }
}