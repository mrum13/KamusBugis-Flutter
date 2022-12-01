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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            bugis,
            style: blackTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            "-",
            style: blackTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            indo,
            style: blackTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
