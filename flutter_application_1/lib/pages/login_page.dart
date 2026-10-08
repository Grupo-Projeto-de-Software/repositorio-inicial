import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

}
  class _LoginPageState extends State<LoginPage> {

    final formKey = GlobalKey<FormState>();
    final TextEditingController senhaController = TextEditingController();
    bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Faça seu login', style: TextStyle(fontSize: 32)),
              SizedBox(height: 30),

              SizedBox(
                width: 700,
                height: 70,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Digite seu Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'Digite um email válido';
                    }
                  },
                ),
              ),

              SizedBox(
                width: 700,
                height: 70,
                child: TextFormField(
                  controller: senhaController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    labelText: 'Digite sua senha',
                    border: OutlineInputBorder(),
                    suffixIcon: Align(widthFactor: 1,
                     heightFactor: 1,
                     child: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      }, 
                      icon: Icon(hidePassword ? Icons.visibility_off: Icons.visibility)),)
                  ),
                  validator: (value) {
                     if (value == null || value.length < 6) {
                      return 'Sua senha precisa ter no mínimo 6 caracteres.';
                    }
                  },
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
      ),
    );
  }
}
