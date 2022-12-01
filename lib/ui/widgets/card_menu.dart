import 'package:flutter/material.dart';
import 'package:kamus_bugis/cubit/list_comparisson_cubit.dart';
import 'package:kamus_bugis/cubit/list_word_cubit.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardMenu extends StatelessWidget {
  final String title, icon;
  final int index;

  const CardMenu({
    Key? key,
    required this.icon,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            {
              context.read<ListWordCubit>().getListWordIndoBugis();
              Navigator.pushNamed(context, "daftar-kata");
            }
            break;
          case 1:
            Navigator.pushNamed(context, "kalimat");
            break;
          case 2:
            Navigator.pushNamed(context, "perbandingan");
        }

        if (index == 2) {
          context.read<ListComparissonCubit>().getListComparisson();
        }
      },
      child: Container(
        width: 100,
        height: 126,
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 4),
        decoration: BoxDecoration(
            color: kWhiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kPrimaryColor)),
        child: Column(
          children: [
            Image.asset(
              icon,
              height: 48,
              width: 48,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                  fontSize: 12, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
