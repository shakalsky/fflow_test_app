import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDataSource {
  final db = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>?> getAll() async {
    try {
      return db.collection("products").get();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
