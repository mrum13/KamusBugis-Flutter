import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:kamus_bugis/main.dart';
import 'package:kamus_bugis/models/list_sentence.dart';

class ListSentenceServices {
  CollectionReference indoBugisCollection =
      FirebaseFirestore.instance.collection('list_kalimat');

  Future<bool> fetchListSentence() async {
    try {
      QuerySnapshot result = await indoBugisCollection.get();

      List listnya = result.docs.map((e) {
        return e.data();
      }).toList();

      // List<ListSentenceModel> listSentence = result.docs.map((e) {
      //   return ListSentenceModel.fromJson(
      //       e.id, e.data() as Map<String, dynamic>);
      // }).toList();

      putListSentenceDataToHive(listnya);

      return true;
    } catch (e) {
      throw e;
    }
  }

  Future<Box> putListSentenceDataToHive(data) async {
    await sentenceDataBox.clear();

    for (var d in data) {
      sentenceDataBox.add(d);
    }

    return sentenceDataBox;
  }

  Future<String> checkListSentenceData() async {
    var myData = sentenceDataBox.values;
    if (myData.isEmpty) {
      return "Data Empty";
    } else {
      return "Data Exist";
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
