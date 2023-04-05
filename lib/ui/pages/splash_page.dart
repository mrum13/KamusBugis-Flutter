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

    bool checkDataLocal() {
      if (sentenceDataLocal == true &&
          compareWordDataLocal == true &&
          listWordBugisDataLocal == true &&
          listWordIndoDataLocal == true) {
        return true;
      } else {
        return false;
      }
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
                  BlocBuilder<CheckListWordLocalCubit, CheckListWordLocalState>(
                    builder: (context, state) {
                      if (state is CheckListWordIndoLocalSuccess) {
                        if (state.status == "Data Exist") {
                          listWordIndoDataLocal = true;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Daftar Kata Ada"),
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            ],
                          );
                        } else {
                          listWordIndoDataLocal = false;
                          context.read<ListWordCubit>().getListWordIndoBugis();
                          return BlocConsumer<ListWordCubit, ListWordState>(
                            listener: (context, state) {
                              if (state is ListWordIndoSuccess) {
                                context
                                    .read<CheckListWordLocalCubit>()
                                    .checkListWordIndoLocal();
                              }
                            },
                            builder: (context, state) {
                              if (state is ListWordFailed) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Gagal Get Daftar Kata !"),
                                    Icon(
                                      Icons.warning_rounded,
                                      color: Colors.red,
                                    )
                                  ],
                                );
                              } else if (state is ListWordLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return const Center(
                                  child: Text("Ada kesalahan"),
                                );
                              }
                            },
                          );
                        }
                      } else if (state is CheckListWordLocalLoading) {
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
                  const SizedBox(
                    height: 8,
                  ),
                  BlocBuilder<CheckSentenceLocalCubit, CheckSentenceLocalState>(
                    builder: (context, state) {
                      if (state is CheckSentenceLocalSuccess) {
                        if (state.status == "Data Exist") {
                          sentenceDataLocal = true;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Data Kalimat Ada"),
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            ],
                          );
                        } else {
                          sentenceDataLocal = false;
                          context.read<ListSentenceCubit>().getListSentence();
                          return BlocConsumer<ListSentenceCubit,
                              ListSentenceState>(
                            listener: (context, state) {
                              if (state is ListSentenceSuccess) {
                                context
                                    .read<CheckSentenceLocalCubit>()
                                    .checkSentenceLocal();
                              }
                            },
                            builder: (context, state) {
                              if (state is ListSentenceFailed) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Gagal get data Kalimat !"),
                                    Icon(
                                      Icons.warning_rounded,
                                      color: Colors.red,
                                    )
                                  ],
                                );
                              } else if (state is ListSentenceLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return const Center(
                                  child: Text("Ada kesalahan"),
                                );
                              }
                            },
                          );
                        }
                      } else if (state is CheckSentenceLocalLoading) {
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
                  const SizedBox(
                    height: 8,
                  ),
                  BlocBuilder<CheckCompareWordLocalCubit,
                      CheckCompareWordLocalState>(
                    builder: (context, state) {
                      if (state is CheckCompareWordLocalSuccess) {
                        if (state.status == "Data Exist") {
                          compareWordDataLocal = true;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Data Perbandingan Kata Ada"),
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            ],
                          );
                        } else {
                          compareWordDataLocal = false;
                          context
                              .read<ListComparissonCubit>()
                              .getListComparisson();
                          return BlocConsumer<ListComparissonCubit,
                              ListComparissonState>(
                            listener: (context, state) {
                              if (state is ListComparissonSuccess) {
                                context
                                    .read<CheckCompareWordLocalCubit>()
                                    .checkCompareWordLocal();
                              }
                            },
                            builder: (context, state) {
                              if (state is ListComparissonFailed) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Gagal get data Perbandingan Kata !"),
                                    Icon(
                                      Icons.warning_rounded,
                                      color: Colors.red,
                                    )
                                  ],
                                );
                              } else if (state is ListComparissonLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return const Center(
                                  child: Text("Ada kesalahan"),
                                );
                              }
                            },
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
                  const SizedBox(
                    height: 42,
                  ),
                  Visibility(
                    visible: true,
                    child: PrimaryButton(
                        title: "Ayo Mulai",
                        onTap: () {
                          Navigator.pushNamed(context, 'home');
                        }),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
