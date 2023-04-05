import 'package:flutter/material.dart';
import 'package:kamus_bugis/cubit/check_compare_word_local_cubit.dart';
import 'package:kamus_bugis/cubit/list_comparisson_cubit.dart';
import 'package:kamus_bugis/main.dart';
import 'package:kamus_bugis/models/list_comparisson_word.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/card_item_list_perbandingan.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PerbandinganKataPage extends StatefulWidget {
  const PerbandinganKataPage({Key? key}) : super(key: key);

  @override
  State<PerbandinganKataPage> createState() => _PerbandinganKataPageState();
}

class _PerbandinganKataPageState extends State<PerbandinganKataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              //Noted: Header
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
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
                    "Perbandingan Kata bugis",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  )
                ],
              ),

              const SizedBox(
                height: 16,
              ),
              Expanded(child: BlocBuilder<CheckCompareWordLocalCubit,
                  CheckCompareWordLocalState>(
                builder: (context, state) {
                  if (state is CheckCompareWordLocalLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CheckCompareWordLocalFailed) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else if (state is CheckCompareWordLocalSuccess) {
                    if (state.status == "Data Exist") {
                      List listCompareWord = [];
                      var myMap = compareWordDataBox.toMap().values.toList();
                      listCompareWord = myMap;

                      return ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            String str = listCompareWord[index]["Bugis_Umum"];
                            String doubleWord = '';

                            for (int i = 0; i < str.length - 1; i++) {
                              if (str[i] == str[i + 1]) {
                                doubleWord = str[i] + str[i + 1];
                                break;
                              }
                            }

                            String firstWordBugis = listCompareWord[index]
                                    ["Bugis_Umum"]
                                .substring(0, 1);
                            String secondWordBugis = listCompareWord[index]
                                    ["Bugis_Umum"]
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

                            return CardItemListPerbandingan(
                                indo: listCompareWord[index]["Indonesia"],
                                bugisUmum: listCompareWord[index]["Bugis_Umum"],
                                bugisPinrang: listCompareWord[index]
                                    ["Bugis_Pinrang"],
                                lontara: doubleWord == ""
                                    ? combineWordBugis.toLowerCase()
                                    : combineWordBugis
                                        .replaceAll(doubleWord, doubleWord[0])
                                        .toLowerCase());
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 8,
                              ),
                          itemCount: listCompareWord.length);
                    } else {
                      return const Center(
                        child: Text("Data Kosong !"),
                      );
                    }
                  } else {
                    return const Center(
                      child: Text("Ada Kesalahan"),
                    );
                  }
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
