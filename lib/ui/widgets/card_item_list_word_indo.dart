import 'package:flutter/material.dart';
import 'package:kamus_bugis/models/list_word_model.dart';
import 'package:kamus_bugis/shared/themes.dart';

class CardItemListWordIndo extends StatelessWidget {
  final String indo;
  final String bugis;

  const CardItemListWordIndo({
    Key? key,
    required this.bugis,
    required this.indo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                indo,
                style: blackTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    bugis,
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(bugis,
                      style: TextStyle(
                          fontFamily: 'Lontara',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: kBlackColor)),
                ],
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
