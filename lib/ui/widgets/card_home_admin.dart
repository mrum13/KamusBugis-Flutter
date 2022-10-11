import 'package:flutter/material.dart';
import 'package:kamus_bugis/cubit/list_comparisson_cubit.dart';
import 'package:kamus_bugis/cubit/list_sentence_cubit.dart';
import 'package:kamus_bugis/cubit/list_word_cubit.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardHomeAdmin extends StatelessWidget {
  final String title, image;
  final int index;

  const CardHomeAdmin({
    Key? key,
    required this.index,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, "list-kata-admin");
            break;
          case 1:
            Navigator.pushNamed(context, "list-perbandingan-admin");
            break;
          case 2:
            Navigator.pushNamed(context, "list-kalimat-admin");
        }

        if (index == 0) {
          context.read<ListWordCubit>().getListWordIndoBugis();
        } else if (index == 1) {
          context.read<ListComparissonCubit>().getListComparisson();
        } else if (index == 2) {
          context.read<ListSentenceCubit>().getListSentence();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kPrimaryColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 64,
              width: 64,
            ),
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: Text(
                title,
                style: blackTextStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
