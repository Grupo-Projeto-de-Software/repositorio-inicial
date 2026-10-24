import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/cores_aman.dart';

import 'pages/landingpage.dart';

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AMAN confeitaria e refeições',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: CoresAman.fundo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: CoresAman.roxo,
          primary: CoresAman.roxo,
          secondary: CoresAman.dourado,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: CoresAman.fundo,
          foregroundColor: CoresAman.texto,
          titleTextStyle: TextStyle(fontSize: 24),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: CoresAman.branco,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CoresAman.borda),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CoresAman.roxo),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: CoresAman.roxo,
            foregroundColor: CoresAman.branco,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: Landingpage(),
    );
  }
}
