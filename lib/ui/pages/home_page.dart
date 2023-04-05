import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamus_bugis/cubit/check_sentence_local_cubit.dart';
import 'package:kamus_bugis/cubit/list_sentence_cubit.dart';
import 'package:kamus_bugis/cubit/list_word_cubit.dart';
import 'package:kamus_bugis/main.dart';
import 'package:kamus_bugis/models/list_sentence.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/card_kalimat.dart';
import 'package:kamus_bugis/ui/widgets/card_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Noted: Header
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "login-admin");
                      },
                      child: Image.asset(
                        "assets/icon_logo.png",
                        height: 100,
                        width: 100,
                      ),
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
                    Visibility(
                      visible: false,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "info");
                            },
                            child: Image.asset(
                              "assets/icon_info.png",
                              height: 24,
                              width: 24,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    // context.read<ListWordCubit>().getListWordIndoBugis();
                    Navigator.pushNamed(context, "search");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        color: kCardColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mau cari kata apa ???",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: kWhiteColor,
                              border: Border.all(color: kGreyColor),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/icon_search.png",
                                height: 24,
                                width: 24,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Pelajari bahasa bugis",
                  style: blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardMenu(
                        index: 0,
                        icon: "assets/icon_daftar_kata.png",
                        title: "Daftar Kata"),
                    CardMenu(
                        index: 1,
                        icon: "assets/icon_kalimat.png",
                        title: "Kalimat"),
                    CardMenu(
                        index: 2,
                        icon: "assets/icon_perbandingan kata.png",
                        title: "Perbandingan Kata"),
                  ],
                ),

                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Bahasa bugis untuk hari ini",
                  style: blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 14,
                ),
                BlocBuilder<CheckSentenceLocalCubit, CheckSentenceLocalState>(
                  builder: (context, state) {
                    if (state is CheckSentenceLocalSuccess) {
                      if (state.status == "Data Exist") {
                        List listSentence = [];
                        var myMap = sentenceDataBox.toMap().values.toList();
                        listSentence = myMap;
                        // return Column(
                        //   children: listSentence.take(3).map((ListSentence) {
                        //     return Column(
                        //       children: [
                        //         CardKalimat(listSentence),
                        //         const SizedBox(
                        //           height: 8,
                        //         )
                        //       ],
                        //     );
                        //   }).toList(),
                        // );

                        return ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              String str = listSentence[index]["Bugis"];
                              String doubleWord = '';

                              for (int i = 0; i < str.length - 1; i++) {
                                if (str[i] == str[i + 1]) {
                                  doubleWord = str[i] + str[i + 1];
                                  break;
                                }
                              }

                              String firstWordBugis =
                                  listSentence[index]["Bugis"].substring(0, 1);
                              String secondWordBugis = listSentence[index]
                                      ["Bugis"]
                                  .replaceAll("nca", "C")
                                  .replaceAll("nci", "Ci")
                                  .replaceAll("ncu", "Cu")
                                  .replaceAll("nce", "Ce")
                                  .replaceAll("nco", "Co")
                                  .replaceAll("nga", "G")
                                  .replaceAll("ngi", "Gi")
                                  .replaceAll("ngu", "u")
                                  .replaceAll("nge", "Ge")
                                  .replaceAll("ngo", "Go")
                                  .replaceAll("nra", "R")
                                  .replaceAll("nri", "Ri")
                                  .replaceAll("nru", "Ru")
                                  .replaceAll("nre", "Re")
                                  .replaceAll("nro", "Ro")
                                  .replaceAll("mpa", "P")
                                  .replaceAll("mpi", "Pi")
                                  .replaceAll("mpu", "Pu")
                                  .replaceAll("mpe", "Pe")
                                  .replaceAll("mpo", "Po")
                                  .replaceAll("ngka", "K")
                                  .replaceAll("ngki", "Ki")
                                  .replaceAll("ngku", "Ku")
                                  .replaceAll("ngke", "Ke")
                                  .replaceAll("ngko", "Ko")
                                  .replaceAll("nya", "N")
                                  .replaceAll("nyi", "Ni")
                                  .replaceAll("nyu", "Nu")
                                  .replaceAll("nye", "Ne")
                                  .replaceAll("nyo", "No")
                                  .substring(1)
                                  .replaceAll(
                                      RegExp("(?<![aeiou])[aA](?![eaiou])"), "")
                                  .replaceAll("ng", "");

                              String combineWordBugis =
                                  firstWordBugis + secondWordBugis;

                              return CardKalimat(
                                  indo: listSentence[index]['Indonesia'],
                                  bugis: listSentence[index]['Bugis'],
                                  lontara: doubleWord == ""
                                      ? combineWordBugis.toLowerCase()
                                      : combineWordBugis
                                          .replaceAll(doubleWord, doubleWord[0])
                                          .toLowerCase());
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 8,
                                ),
                            itemCount: 3);
                      } else {
                        return const Center(
                          child: Text("Data Kosong !"),
                        );
                      }
                    } else if (state is CheckSentenceLocalLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is CheckSentenceLocalFailed) {
                      return Center(
                        child: Text(state.error),
                      );
                    } else {
                      return const Center(
                        child: Text("Ada Kesalahan"),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
