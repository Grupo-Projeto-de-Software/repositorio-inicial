import 'package:flutter/material.dart';

class SubcategoriaPage extends StatelessWidget {
  final String categoria;

  const SubcategoriaPage({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoria)),
      body: Center(
        child: Text(
          'Subcategorias de $categoria',
          style: const TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
