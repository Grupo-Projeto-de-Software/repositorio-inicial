import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  ////TRANSFORMAR EM STATEFUL PORQUE O CONTROLADOR MUDA DE ESTADO
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmacaoController = TextEditingController();
  bool hidePassword = true;
  bool hideConfirmation = true;

  @override
  void dispose() {
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
                      return 'Digite a senha correta';
                    }
                    return null;
                  },
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print('Formulário válido');
                  } else {
                    print('inválido');
                  }
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
