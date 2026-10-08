import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Faça seu login', style: TextStyle(fontSize: 32)),
            SizedBox(height: 30),

            SizedBox(
              width: 700,
              height: 70,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Digite seu Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            SizedBox(
              width: 700,
              height: 70,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Digite sua senha',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                print('login request');
              },
              child: Text('Fazer login'),
            ),
          ],
        ),
      ),
    );
  }
}
