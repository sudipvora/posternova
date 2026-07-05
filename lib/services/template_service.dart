import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/template_model.dart';

class TemplateService {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  Stream<List<TemplateModel>> getTemplates() {
    return _firestore
        .collection('templates')
        .where('active', isEqualTo: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return TemplateModel.fromMap(
          doc.id,
          doc.data(),
        );
      }).toList();
    });
  }
}