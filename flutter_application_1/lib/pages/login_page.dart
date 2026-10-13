import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController senhaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool hidePassword = true;

  final AuthService authService = AuthService();

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

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

              //EMAIL
              SizedBox(
                width: 700,
                height: 70,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Digite seu Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Digite seu e-mail';
                    }

                    if (!value.contains('@')) {
                      return 'Digite um e-mail válido';
                    }

                    return null;
                  },
                ),
              ),

              //SENHA
              SizedBox(
                width: 700,
                height: 70,
                child: TextFormField(
                  controller: senhaController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    labelText: 'Digite sua senha',
                    border: OutlineInputBorder(),
                    suffixIcon: Align(
                      widthFactor: 1,
                      heightFactor: 1,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        icon: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Sua senha precisa ter no mínimo 6 caracteres.';
                    }
                    return null;
                  },
                ),
              ),

              ElevatedButton(
                onPressed: () async {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }

                  try {
                    await authService.login(
                      email: emailController.text,
                      senha: senhaController.text,
                    );

                    if (!mounted) return;

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } on FirebaseAuthException catch (e) {
                    if (!mounted) return;

                    String mensagem;

                    switch (e.code) {
                      case 'invalid-credential':
                        mensagem = 'E-mail ou senha incorretos.';
                        break;
                      case 'invalid-email':
                        mensagem = 'Digite um e-mail válido.';
                        break;
                      case 'user-disabled':
                        mensagem = 'Esta conta está desativada.';
                        break;
                      case 'too-many-requests':
                        mensagem =
                            'Muitas tentativas. Tente novamente mais tarde.';
                        break;
                      default:
                        mensagem = 'Não foi possível realizar o login.';
                    }

                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(mensagem)));
                  } catch (e) {
                    debugPrint('Erro no login: $e');

                    if (!mounted) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Ocorreu um erro inesperado.'),
                      ),
                    );
                  }
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
