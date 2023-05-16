import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kamus_bugis/cubit/check_compare_word_local_cubit.dart';
import 'package:kamus_bugis/cubit/check_list_word_local_cubit.dart';
import 'package:kamus_bugis/cubit/check_sentence_local_cubit.dart';
import 'package:kamus_bugis/cubit/list_comparisson_cubit.dart';
import 'package:kamus_bugis/cubit/list_sentence_cubit.dart';
import 'package:kamus_bugis/cubit/list_word_cubit.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<CheckSentenceLocalCubit>().checkSentenceLocal();
    context.read<CheckCompareWordLocalCubit>().checkCompareWordLocal();
    context.read<CheckListWordLocalCubit>().checkListWordBugisLocal();
    context.read<CheckListWordLocalCubit>().checkListWordIndoLocal();
  }

  @override
  Widget build(BuildContext context) {
    bool sentenceDataLocal = false;
    bool compareWordDataLocal = false;
    bool listWordBugisDataLocal = false;
    bool listWordIndoDataLocal = false;

    void checkDataLocal(bool status) {
      log(status.toString());

      compareWordDataLocal = status;
    }

    return Scaffold(
        backgroundColor: kWhiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Image.asset(
                    "assets/icon_logo.png",
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  BlocBuilder<CheckCompareWordLocalCubit,
                      CheckCompareWordLocalState>(
                    builder: (context, state) {
                      if (state is CheckCompareWordLocalSuccess) {
                        if (state.status == "Data Exist") {
                          checkDataLocal(false);
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'home', (route) => false);
                          return SizedBox();
                        } else {
                          checkDataLocal(true);
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Gagal memuat data !"),
                                  Icon(
                                    Icons.warning_rounded,
                                    color: Colors.red,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              PrimaryButton(
                                  title: "Muat ulang",
                                  onTap: () {
                                    context
                                        .read<CheckSentenceLocalCubit>()
                                        .checkSentenceLocal();
                                    context
                                        .read<CheckCompareWordLocalCubit>()
                                        .checkCompareWordLocal();
                                    context
                                        .read<CheckListWordLocalCubit>()
                                        .checkListWordBugisLocal();
                                    context
                                        .read<CheckListWordLocalCubit>()
                                        .checkListWordIndoLocal();
                                  }),
                            ],
                          );
                        }
                      } else if (state is ListComparissonLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Center(
                          child: Text("Ada Kesalahan !"),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
