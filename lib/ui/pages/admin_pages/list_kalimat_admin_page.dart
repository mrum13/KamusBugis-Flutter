import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamus_bugis/cubit/check_sentence_local_cubit.dart';
import 'package:kamus_bugis/cubit/list_sentence_cubit.dart';
import 'package:kamus_bugis/main.dart';
import 'package:kamus_bugis/models/list_sentence.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/card_kalimat.dart';

class ListKalimatAdminPage extends StatelessWidget {
  const ListKalimatAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Noted: Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "home-admin");
                      },
                      child: Image.asset(
                        "assets/icon_arrow_back.png",
                        height: 24,
                        width: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Kalimat Bugis",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "tambah-kalimat-admin");
                  },
                  child: Image.asset(
                    "assets/icon_add.png",
                    height: 24,
                    width: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(child:
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
                          String secondWordBugis = listSentence[index]["Bugis"]
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
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 8,
                            ),
                        itemCount: listSentence.length);
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
            ))
          ],
        ),
      )),
    );
  }
}
