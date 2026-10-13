import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> salvarPerfil({
    required String uid,
    required String nome,
    required String email,
  }) async {
    await _db.collection('usuarios').doc(uid).set({
      'nome': nome.trim(),
      'email': email.trim(),
      'criadoEm': FieldValue.serverTimestamp(),
    });
  }

  Future<Map<String, dynamic>?> buscarPerfil(String uid) async {
    final documento = await _db.collection('usuarios').doc(uid).get();

    if (!documento.exists) {
      return null;
    }

    return documento.data();
  }
}
