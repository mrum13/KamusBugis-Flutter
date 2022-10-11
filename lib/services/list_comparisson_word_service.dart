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

  Future<String> setComparisson(
      {required String bugisUmum,
      required String bugisPinrang,
      required String indo}) async {
    try {
      comparissonWordCollection.doc(indo).set({
        'Bugis_Pinrang': bugisPinrang,
        'Bugis_Umum': bugisUmum,
        'Indonesia': indo,
      });
      return "Berhasil menambahkan perbandingan kata";
    } catch (e) {
      throw e;
    }
  }
}
