Class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (title: Text ("Cardápio")),
      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Image.asset(
                'assets/images/logo_aman.png',
                width: 130,
                fit: BoxFit.contain,
              )
            ]
        ),
        child: 
        Row (
          children: [
            Expanded( 
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center, 
              children:[
                Text ("Salgados Fritos", style: TextStyle (fontsize: 32)),
              ]
            )),
            Expanded(
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center, 
              children:[
                Text ("Salgados Assados", style: TextStyle (fontsize: 32)),
              ]
            )),
            Expanded(
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center, 
              children:[
                Text ("Bebidas", style: TextStyle (fontsize: 32)),
              ]
            )),
            Expanded(
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center, 
              children:[
                Text ("Doces", style: TextStyle (fontsize: 32)),
              ]
            )),
            Expanded(
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center, 
              children:[
                Text ("Outros Produtos", style: TextStyle (fontsize: 32)),
              ]
            )),
          ]
        )
      
      
      )
    );
  }
} 




//criar função para facilitar disposição de botões dentro das columns na row 
//fazer a função que define um botão universal que pediria os parametros tipo e nome que vão ser pegos por um switch que vai direcionar a rota correta para o produto
