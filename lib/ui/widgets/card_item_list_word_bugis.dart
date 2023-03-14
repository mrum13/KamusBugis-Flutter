import 'package:flutter/material.dart';
import 'package:kamus_bugis/models/list_word_model.dart';
import 'package:kamus_bugis/shared/themes.dart';

class CardItemListWordBugis extends StatelessWidget {
  final String indo;
  final String bugis;

  const CardItemListWordBugis({
    Key? key,
    required this.bugis,
    required this.indo,
  }) : super(key: key);

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
    String secondWordBugis = bugis.substring(1).replaceAll("a", "");

    String combineWordBugis = firstWordBugis + secondWordBugis;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
              Text(
                indo,
                style: blackTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: double.infinity,
            height: 0.5,
            color: kGreyColor,
          )
        ],
      ),
    );
  }
}
