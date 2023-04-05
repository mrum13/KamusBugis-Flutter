import 'package:flutter/material.dart';
import 'package:kamus_bugis/models/list_sentence.dart';
import 'package:kamus_bugis/shared/themes.dart';

class CardKalimat extends StatelessWidget {
  final String indo;
  final String bugis;
  final String lontara;

  const CardKalimat({
    Key? key,
    required this.indo,
    required this.bugis,
    required this.lontara,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromRGBO(240, 240, 240, 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bugis,
            style: blackTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(lontara,
              style: TextStyle(
                  fontFamily: 'Lontara',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: kBlackColor)),
          const SizedBox(
            height: 8,
          ),
          Text(
            indo,
            style: blackTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
