import 'package:flutter/material.dart';
import 'package:kamus_bugis/models/list_comparisson_word.dart';
import 'package:kamus_bugis/shared/themes.dart';

class CardItemListPerbandingan extends StatelessWidget {
  final String indo;
  final String bugisUmum;
  final String bugisPinrang;
  final String lontara;

  const CardItemListPerbandingan({
    Key? key,
    required this.indo,
    required this.bugisUmum,
    required this.bugisPinrang,
    required this.lontara,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: kCardColor),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Indonesia : $indo",
            style: blackTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Bugis Pinrang : $bugisPinrang",
            style: blackTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Bugis Umum : $bugisUmum",
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
              Text(lontara,
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
