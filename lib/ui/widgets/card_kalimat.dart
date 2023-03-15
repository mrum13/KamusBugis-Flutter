import 'package:flutter/material.dart';
import 'package:kamus_bugis/models/list_sentence_model.dart';
import 'package:kamus_bugis/shared/themes.dart';

class CardKalimat extends StatelessWidget {
  final ListSentenceModel listSentenceModel;

  const CardKalimat(
    this.listSentenceModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String str = listSentenceModel.bugis;
    String doubleWord = '';

    for (int i = 0; i < str.length - 1; i++) {
      if (str[i] == str[i + 1]) {
        doubleWord = str[i] + str[i + 1];
        break;
      }
    }

    String firstWordBugis = listSentenceModel.bugis.substring(0, 1);
    String secondWordBugis = listSentenceModel.bugis
        .replaceAll("nca", "C")
        .replaceAll("nci", "Ci")
        .replaceAll("ncu", "Cu")
        .replaceAll("nce", "Ce")
        .replaceAll("nco", "Co")
        .replaceAll("nga", "G")
        .replaceAll("ngi", "Gi")
        .replaceAll("ngu", "u")
        .replaceAll("nge", "Ge")
        .replaceAll("ngo", "Go")
        .replaceAll("nra", "R")
        .replaceAll("nri", "Ri")
        .replaceAll("nru", "Ru")
        .replaceAll("nre", "Re")
        .replaceAll("nro", "Ro")
        .replaceAll("mpa", "P")
        .replaceAll("mpi", "Pi")
        .replaceAll("mpu", "Pu")
        .replaceAll("mpe", "Pe")
        .replaceAll("mpo", "Po")
        .replaceAll("ngka", "K")
        .replaceAll("ngki", "Ki")
        .replaceAll("ngku", "Ku")
        .replaceAll("ngke", "Ke")
        .replaceAll("ngko", "Ko")
        .replaceAll("nya", "N")
        .replaceAll("nyi", "Ni")
        .replaceAll("nyu", "Nu")
        .replaceAll("nye", "Ne")
        .replaceAll("nyo", "No")
        .substring(1)
        .replaceAll(RegExp("(?<![aeiou])[aA](?![eaiou])"), "")
        .replaceAll("ng", "");

    String combineWordBugis = firstWordBugis + secondWordBugis;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromRGBO(240, 240, 240, 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            listSentenceModel.bugis,
            style: blackTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
              doubleWord == ""
                  ? combineWordBugis.toLowerCase()
                  : combineWordBugis
                      .replaceAll(doubleWord, doubleWord[0])
                      .toLowerCase(),
              style: TextStyle(
                  fontFamily: 'Lontara',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: kBlackColor)),
          const SizedBox(
            height: 8,
          ),
          Text(
            listSentenceModel.indonesia,
            style: blackTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
