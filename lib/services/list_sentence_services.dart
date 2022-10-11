import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kamus_bugis/models/list_sentence_model.dart';

class ListSentenceServices {
  CollectionReference indoBugisCollection =
      FirebaseFirestore.instance.collection('list_kalimat');

  Future<List<ListSentenceModel>> fetchListSentence() async {
    try {
      QuerySnapshot result = await indoBugisCollection.get();

      List listnya = result.docs.map((e) {
        return e.data();
      }).toList();

      List<ListSentenceModel> listSentence = result.docs.map((e) {
        return ListSentenceModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return listSentence;
    } catch (e) {
      throw e;
    }
  }

  Future<String> setSentence(
      {required String bugis, required String indo}) async {
    try {
      indoBugisCollection.doc(bugis).set({
        'Bugis': bugis,
        'Indonesia': indo,
      });
      return "Berhasil menambahkan kalimat";
    } catch (e) {
      throw e;
    }
  }
}
