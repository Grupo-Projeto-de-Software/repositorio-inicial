import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/subcategoria_page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  //criando função que vai entender a seleção de qualquer categoria no widget principal
  //pois recebe o parametro nome que vai ser coletado na seleção das categorias la embaixo na row
  Widget criarBotaoCategoria(BuildContext context, String nome) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubcategoriaPage(categoria: nome),
          ),
        );
      },
      child: Text(
        nome,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cardápio")),
      body: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo_aman.png',
              width: 130,
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(height: 30),

          Row(
            children: [
              Expanded(child: criarBotaoCategoria(context, 'Salgados Fritos')),
              Expanded(child: criarBotaoCategoria(context, "Salgados assados")),
              Expanded(child: criarBotaoCategoria(context, "Bebidas")),
              Expanded(child: criarBotaoCategoria(context, 'Doces')),
              Expanded(child: criarBotaoCategoria(context, 'Outros produtos')),
            ],
          ),
        ],
      ),
    );
  }
}

//criar função para facilitar disposição de botões dentro das columns na row
//fazer a função que define um botão universal que pediria os parametros tipo e nome que vão ser pegos por um switch que vai direcionar a rota correta para o produto
