import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kamus_bugis/models/list_comparisson_word_model.dart';

class ListComparissonWordServices {
  CollectionReference comparissonWordCollection =
      FirebaseFirestore.instance.collection('list_perbandingan_kata');

  Future<List<ListComparissonModel>> fetchComparissonWord() async {
    try {
      QuerySnapshot result = await comparissonWordCollection.get();

      List<ListComparissonModel> listComparisson = result.docs.map((e) {
        return ListComparissonModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      print(listComparisson);

      return listComparisson;
    } catch (e) {
      throw e;
    }
  }
}
