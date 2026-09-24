import 'package:flutter/material.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Landing Page Sistema da Cantina"),
      ),
      body: Center(
        child: Text("BEM VINDO AO SITEMA DA CANTINA!"),
      ),
    );
  }
}