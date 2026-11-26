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

  //fazer botao pra subcategoria igual a esse de cima mas que vai ter que pegar parametro da categoria que a subcategoria referida
  //pertence, então depois ele vai acessar subcategoria page com as imagens dos itens da subcategoria de subcategoria.dart

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
              //subcategoriabotao
            ],
          ),
        ],
      ),
    );
  }
}
