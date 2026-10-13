import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/pages/landingpage.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:flutter_application_1/services/user_service.dart';

class SignUpPage extends StatefulWidget {
  ////TRANSFORMAR EM STATEFUL PORQUE O CONTROLADOR MUDA DE ESTADO
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //chave do formulario
  final formKey = GlobalKey<FormState>();

  //controllers
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmacaoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();

  //esconder senhas
  bool hidePassword = true;
  bool hideConfirmation = true;

  //serviço de autencicação
  final AuthService authService = AuthService();
  final UserService userService = UserService();

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    confirmacaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro')),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Faça seu cadastro', style: TextStyle(fontSize: 32)),
              SizedBox(height: 30),

              //INSERIR NOME
              SizedBox(
                width: 700,
                height: 90,
                child: TextFormField(
                  controller: nomeController,
                  decoration: InputDecoration(
                    labelText: 'Digite seu nome',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Digite seu nome';
                    }
                    return null;
                  },
                ),
              ),

              //INSERIR EMAIL
              SizedBox(
                width: 700,
                height: 90,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Digite seu Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Digite seu email';
                    }
                    if (!value.contains('@')) {
                      return 'Digite um email válido';
                    }
                    return null;
                  },
                ),
              ),

              //INSERIR SENHA
              SizedBox(
                width: 700,
                height: 90,
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

              //CONFIRMAR SENHA
              SizedBox(
                width: 700,
                height: 90,
                child: TextFormField(
                  controller: confirmacaoController,
                  obscureText: hideConfirmation,
                  decoration: InputDecoration(
                    labelText: 'Confirme sua senha',
                    border: OutlineInputBorder(),
                    suffixIcon: Align(
                      widthFactor: 1,
                      heightFactor: 1,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            hideConfirmation = !hideConfirmation;
                          });
                        },
                        icon: Icon(
                          hideConfirmation
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value != senhaController.text) {
                      return 'As senhas não coincidem';
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
                    final credencial = await authService.cadastrar(
                      email: emailController.text,
                      senha: senhaController.text,
                    );

                    final usuario = credencial.user;
                    if (usuario == null) {
                      throw Exception('Não foi possível criar a conta');
                    }

                    debugPrint('Conta criada. UID: ${usuario.uid}');
                    debugPrint('Tentando salvar perfil no Firestore...');

                    await userService.salvarPerfil(
                      uid: usuario.uid,
                      nome: nomeController.text,
                      email: emailController.text,
                    );
                    debugPrint('Perfil salvo com sucesso!');

                    if (!mounted) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cadastro relizado com sucesso!'),
                      ),
                    );
                  } on FirebaseAuthException catch (e) {
                    if (!mounted) return;

                    String mensagem;

                    switch (e.code) {
                      case 'email-already-in-use':
                        mensagem = 'Este email já está sendo usado.';
                        break;
                      case 'invalid-email':
                        mensagem = 'Este email é inválido.';
                        break;
                      case 'weak-password':
                        mensagem = 'A senha é muito fraca.';
                        break;
                      default:
                        mensagem = 'Não foi possível realizar o cadastro.';
                    }

                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(mensagem)));
                  } catch (e, stackTrace) {
                    debugPrint('Erro durante o cadastro: $e');
                    debugPrint('Detalhes: $stackTrace');

                    if (!mounted) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Ocorreu um erro inesperado.')),
                    );
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Landingpage()),
                  );
                },
                child: Text('Fazer cadastro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
