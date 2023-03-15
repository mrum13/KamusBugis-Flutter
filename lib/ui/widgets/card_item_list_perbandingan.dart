import 'package:flutter/material.dart';
import 'package:kamus_bugis/models/list_comparisson_word_model.dart';
import 'package:kamus_bugis/shared/themes.dart';

class CardItemListPerbandingan extends StatelessWidget {
  final ListComparissonModel listComparisson;

  const CardItemListPerbandingan(this.listComparisson, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String str = listComparisson.bugisUmum;
    String doubleWord = '';

    for (int i = 0; i < str.length - 1; i++) {
      if (str[i] == str[i + 1]) {
        doubleWord = str[i] + str[i + 1];
        break;
      }
    }

    String firstWordBugis = listComparisson.bugisUmum.substring(0, 1);
    String secondWordBugis = listComparisson.bugisUmum
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
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: kCardColor),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Indonesia : ${listComparisson.indonesia}",
            style: blackTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Bugis Pinrang : ${listComparisson.bugisPinrang}",
            style: blackTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Bugis Umum : ${listComparisson.bugisUmum}",
            style: blackTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(
                "Lontara Bugis : ",
                style: blackTextStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w400),
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
            ],
          ),
        ],
      ),
    );
  }
}
