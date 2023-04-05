import 'package:flutter/material.dart';
import 'package:kamus_bugis/cubit/check_compare_word_local_cubit.dart';
import 'package:kamus_bugis/cubit/check_list_word_local_cubit.dart';
import 'package:kamus_bugis/cubit/check_sentence_local_cubit.dart';
import 'package:kamus_bugis/cubit/list_comparisson_cubit.dart';
import 'package:kamus_bugis/cubit/list_sentence_cubit.dart';
import 'package:kamus_bugis/cubit/list_word_cubit.dart';
import 'package:kamus_bugis/main.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/card_home_admin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAdminPage extends StatefulWidget {
  const HomeAdminPage({Key? key}) : super(key: key);

  @override
  State<HomeAdminPage> createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<ListWordCubit>().getListWordIndoBugis();
    // context.read<ListSentenceCubit>().getListSentence();
    // context.read<ListComparissonCubit>().getListComparisson();
  }

  @override
  Widget build(BuildContext context) {
    String lengthWord = "0";
    String lengthSentence = "0";
    String lengthCompare = "0";

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Noted: Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icon_logo.png",
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Text(
                    "Belajar bahasa bugis jadi lebih mudah dan cepat",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "login-admin");
                        },
                        child: Image.asset(
                          "assets/icon_logout.png",
                          height: 24,
                          width: 24,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                "Selamat datang admin",
                style: blackTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 14,
              ),
              BlocBuilder<CheckListWordLocalCubit, CheckListWordLocalState>(
                builder: (context, state) {
                  if (state is CheckListWordIndoLocalSuccess) {
                    if (state.status == "Data Exist") {
                      List listWord = [];
                      var myMap = listWordDataBox.toMap().values.toList();
                      listWord = myMap;

                      lengthWord = listWord.length.toString();
                    } else {
                      lengthWord = "0";
                    }
                  } else if (state is ListWordLoading) {
                    lengthWord = "-";
                  } else if (state is ListWordFailed) {
                    lengthWord = "e";
                  }
                  return CardHomeAdmin(
                    length: lengthWord,
                    image: "assets/icon_daftar_kata.png",
                    index: 0,
                    title: "Tambah Daftar Kata",
                  );
                },
              ),
              const SizedBox(
                height: 24,
              ),
              BlocBuilder<CheckCompareWordLocalCubit,
                  CheckCompareWordLocalState>(
                builder: (context, state) {
                  if (state is CheckCompareWordLocalSuccess) {
                    if (state.status == "Data Exist") {
                      List listCompareWord = [];
                      var myMap = compareWordDataBox.toMap().values.toList();
                      listCompareWord = myMap;

                      lengthCompare = listCompareWord.length.toString();
                    } else {
                      lengthCompare = "0";
                    }
                  } else if (state is CheckCompareWordLocalLoading) {
                    lengthCompare = "-";
                  } else if (state is CheckCompareWordLocalFailed) {
                    lengthCompare = "e";
                  }
                  return CardHomeAdmin(
                    length: lengthCompare,
                    image: "assets/icon_perbandingan kata.png",
                    index: 1,
                    title: "Tambah Perbandingan Kata",
                  );
                },
              ),
              const SizedBox(
                height: 24,
              ),
              BlocBuilder<CheckSentenceLocalCubit, CheckSentenceLocalState>(
                builder: (context, state) {
                  if (state is CheckSentenceLocalSuccess) {
                    if (state.status == "Data Exist") {
                      List listSentence = [];
                      var myMap = sentenceDataBox.toMap().values.toList();
                      listSentence = myMap;

                      lengthSentence = listSentence.length.toString();
                    } else {
                      lengthSentence = "0";
                    }
                  } else if (state is CheckSentenceLocalLoading) {
                    lengthSentence = "-";
                  } else if (state is CheckSentenceLocalFailed) {
                    lengthSentence = "e";
                  }
                  return CardHomeAdmin(
                    length: lengthSentence,
                    image: "assets/icon_kalimat.png",
                    index: 2,
                    title: "Tambah Kalimat",
                  );
                },
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
