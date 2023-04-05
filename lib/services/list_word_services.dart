import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:kamus_bugis/main.dart';
import 'package:kamus_bugis/models/list_word.dart';

class ListWordServices {
  CollectionReference indoBugisCollection =
      FirebaseFirestore.instance.collection('list_kata_indo_bugis');

  Future<bool> fetchListWordIndoBugis() async {
    try {
      QuerySnapshot result = await indoBugisCollection.get();

      List listnya = result.docs.map((e) {
        return e.data();
      }).toList();

      // List<ListWordModel> listWord = result.docs.map((e) {
      //   return ListWordModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      // }).toList();

      putListWordDataToHive(listnya);

      return true;
    } catch (e) {
      throw e;
    }
  }

  Future<Box> putListWordDataToHive(data) async {
    await listWordDataBox.clear();

    for (var d in data) {
      listWordDataBox.add(d);
    }

    return listWordDataBox;
  }

  Future<String> checkListWordData() async {
    var myData = listWordDataBox.values;
    if (myData.isEmpty) {
      return "Data Empty";
    } else {
      return "Data Exist";
    }
  }

  Future<String> setWord({
    required String bugis,
    required String indo,
    required String abjadBugis,
    required String abjadIndo,
  }) async {
    try {
      indoBugisCollection.doc(indo).set({
        'Bugis': bugis,
        'Indonesia': indo,
        'Abjad_Bugis': abjadBugis,
        'Abjad_Indonesia': abjadIndo,
      });
      return "Berhasil menambahkan kata";
    } catch (e) {
      throw e;
    }
  }
}
