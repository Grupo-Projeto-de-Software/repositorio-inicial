import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/cores_aman.dart';

import 'login_page.dart';
import 'signup_page.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_aman.png',
              width: 200,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 30),

            Text(
              "Bem vindo! Esse é o sistema de controle de estoque da AMAN.",
              style: TextStyle(fontSize: 20, color: CoresAman.texto),
            ),

            SizedBox(height: 30),

            SizedBox(
              height: 50,
              width: 600,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: Text("Entrar"),
              ),
            ),

            SizedBox(height: 10),

            SizedBox(
              height: 50,
              width: 600,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Text('Cadastrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
