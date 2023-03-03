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
                  Text(bugis,
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
