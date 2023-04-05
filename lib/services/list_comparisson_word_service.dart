import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:kamus_bugis/main.dart';

class ListComparissonWordServices {
  CollectionReference comparissonWordCollection =
      FirebaseFirestore.instance.collection('list_perbandingan_kata');

  Future<bool> fetchComparissonWord() async {
    try {
      QuerySnapshot result = await comparissonWordCollection.get();

      List listnya = result.docs.map((e) {
        return e.data();
      }).toList();

      // List<ListComparissonModel> listComparisson = result.docs.map((e) {
      //   return ListComparissonModel.fromJson(
      //       e.id, e.data() as Map<String, dynamic>);
      // }).toList();

      putListComparissonWordDataToHive(listnya);

      return true;
    } catch (e) {
      throw e;
    }
  }

  Future<Box> putListComparissonWordDataToHive(data) async {
    await compareWordDataBox.clear();

    for (var d in data) {
      compareWordDataBox.add(d);
    }

    return compareWordDataBox;
  }

  Future<String> checkListComparissonWordData() async {
    var myData = compareWordDataBox.values;
    if (myData.isEmpty) {
      return "Data Empty";
    } else {
      return "Data Exist";
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
