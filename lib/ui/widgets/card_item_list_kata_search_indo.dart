import 'package:flutter/material.dart';
import 'package:kamus_bugis/shared/themes.dart';

class CardItemListKataSearchIndo extends StatelessWidget {
  final String indo;
  final String bugis;

  const CardItemListKataSearchIndo(
      {required this.bugis, required this.indo, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String str = bugis;
    String doubleWord = '';

    for (int i = 0; i < str.length - 1; i++) {
      if (str[i] == str[i + 1]) {
        doubleWord = str[i] + str[i + 1];
        break;
      }
    }

    String firstWordBugis = bugis.substring(0, 1);
    String secondWordBugis = bugis
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${indo}",
              style: blackTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bugis,
                  style: blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                    doubleWord == ""
                        ? combineWordBugis
                        : combineWordBugis.replaceAll(
                            doubleWord, doubleWord[0]),
                    style: TextStyle(
                        fontFamily: 'Lontara',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: kBlackColor)),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: kGreyColor,
        )
      ],
    );
  }
}
