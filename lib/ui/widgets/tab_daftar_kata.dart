import 'package:flutter/material.dart';
import 'package:kamus_bugis/cubit/check_list_word_local_cubit.dart';
import 'package:kamus_bugis/cubit/list_word_cubit.dart';
import 'package:kamus_bugis/cubit/tab_daftar_kata_cubit.dart';
import 'package:kamus_bugis/cubit/tab_daftar_kata_second_cubit.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabDaftarKata extends StatelessWidget {
  final int index;
  final String title;

  const TabDaftarKata({
    Key? key,
    required this.index,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<TabDaftarKataCubit>().setTab(index);
        index == 0
            ? context.read<CheckListWordLocalCubit>().checkListWordIndoLocal()
            : context.read<CheckListWordLocalCubit>().checkListWordBugisLocal();
        // ? context.read<TabDaftarKataSecondCubit>().setPage(false)
        // : context.read<TabDaftarKataSecondCubit>().setPage(true);
      },
      child: BlocBuilder<TabDaftarKataCubit, int>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: context.read<TabDaftarKataCubit>().state == index
                      ? blackTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w600)
                      : blackTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: context.read<TabDaftarKataCubit>().state == index
                      ? kPrimaryColor
                      : kGreyColor,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
