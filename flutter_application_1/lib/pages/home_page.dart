import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/services/user_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final usuario = FirebaseAuth.instance.currentUser;
    final userService = UserService();

    if (usuario == null) {
      return const Scaffold(
        body: Center(child: Text('Nenhum usuário autenticado.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Cantina AMAN')),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>?>(
          future: userService.buscarPerfil(usuario.uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return const Text('Não foi possível carregar os dados.');
            }

            final perfil = snapshot.data;

            if (perfil == null) {
              return const Text('Perfil não encontrado no banco de dados.');
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.account_circle, size: 80),
                const SizedBox(height: 16),
                Text(
                  'Bem-vindo, ${perfil['nome']}!',
                  style: const TextStyle(fontSize: 26),
                ),
                const SizedBox(height: 8),
                Text(
                  'E-mail: ${perfil['email']}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
