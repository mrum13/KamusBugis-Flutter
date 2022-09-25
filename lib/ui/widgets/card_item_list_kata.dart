import 'package:flutter/material.dart';
import 'package:kamus_bugis/shared/themes.dart';

class CardItemListKata extends StatelessWidget {
  const CardItemListKata({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Makan - Mandre",
          style: blackTextStyle.copyWith(
              fontSize: 14, fontWeight: FontWeight.w400),
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
