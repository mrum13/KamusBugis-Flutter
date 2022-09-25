import 'package:flutter/material.dart';
import 'package:kamus_bugis/shared/themes.dart';

class CardKalimat extends StatelessWidget {
  final String bugis;
  final String indo;

  const CardKalimat({
    Key? key,
    required this.bugis,
    required this.indo,
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
            "Pura ki mandre ?",
            style: blackTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Kamu sudah makan ?",
            style: blackTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
