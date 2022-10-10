import 'package:flutter/material.dart';
import 'package:kamus_bugis/models/list_word_model.dart';
import 'package:kamus_bugis/shared/themes.dart';

class CardItemListWordIndo extends StatelessWidget {
  final ListWordModel listWordModel;

  const CardItemListWordIndo(this.listWordModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            listWordModel.indonesia,
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
            listWordModel.bugis,
            style: blackTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
