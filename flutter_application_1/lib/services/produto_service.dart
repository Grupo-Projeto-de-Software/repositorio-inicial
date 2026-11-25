import 'package:cloud_firestore/cloud_firestore.dart';

class ProdutoService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> cadastrarProduto({
    required String nomeProduto,
    required String categoria,
    required String subcategoria,
    required double preco,
    required int quantidade,
    required String codigoProduto,
  }) async {
    await _db.collection('produtos').add({
      'nomeProduto': nomeProduto.trim(),
      'categoria': categoria.trim(),
      'subcategoria': subcategoria.trim(),
      'preco': preco,
      'quantidade': quantidade,
      'codigoProduto': codigoProduto.trim(),
    });
  }

  Future<List<Map<String, dynamic>>> buscarProduto() async {
    final consulta = await _db.collection('produtos').get();

    return consulta.docs.map((doc) => doc.data()).toList();
  }

  Future<void> atualizarProduto({
    required String id,
    required String nomeProduto,
    required String categoria,
    required String subcategoria,
    required double preco,
    required int quantidade,
    required String codigoProduto,
  }) async {
    await _db.collection('produtos').doc(id).update({
      'nomeProduto': nomeProduto.trim(),
      'categoria': categoria.trim(),
      'subcategoria': subcategoria.trim(),
      'preco': preco,
      'quantidade': quantidade,
      'codigoProduto': codigoProduto.trim(),
    });
  }

  Future<void> excluirProduto({required String id}) async {
    await _db.collection('produtos').doc(id).delete();
  }
}
