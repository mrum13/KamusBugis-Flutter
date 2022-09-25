import 'package:flutter/material.dart';
import 'package:kamus_bugis/shared/themes.dart';

class CardItemListPerbandingan extends StatelessWidget {
  const CardItemListPerbandingan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: kCardColor),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Indonesia : Mandi",
            style: blackTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Bugis Pinrang : Dio",
            style: blackTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Bugis Umum : Cemme",
            style: blackTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
