import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kamus_bugis/models/list_word_model.dart';

class ListWordServices {
  CollectionReference indoBugisCollection =
      FirebaseFirestore.instance.collection('list_kata_indo_bugis');

  Future<List<ListWordModel>> fetchListWordIndoBugis() async {
    try {
      QuerySnapshot result = await indoBugisCollection.get();

      List listnya = result.docs.map((e) {
        return e.id;
      }).toList();

      List<ListWordModel> listWord = result.docs.map((e) {
        return ListWordModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return listWord;
    } catch (e) {
      throw e;
    }
  }
}
