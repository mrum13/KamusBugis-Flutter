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
