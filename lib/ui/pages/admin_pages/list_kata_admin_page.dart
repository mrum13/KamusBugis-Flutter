import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:kamus_bugis/cubit/check_list_word_local_cubit.dart';
import 'package:kamus_bugis/cubit/list_word_cubit.dart';
import 'package:kamus_bugis/cubit/tab_daftar_kata_second_cubit.dart';
import 'package:kamus_bugis/main.dart';
import 'package:kamus_bugis/models/list_word.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/card_item_list_word_bugis.dart';
import 'package:kamus_bugis/ui/widgets/card_item_list_word_indo.dart';
import 'package:kamus_bugis/ui/widgets/tab_daftar_kata.dart';

class ListKataAdminPage extends StatelessWidget {
  const ListKataAdminPage({Key? key}) : super(key: key);

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
                        "Daftar Kata",
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "tambah-kata-admin");
                        },
                        child: Image.asset(
                          "assets/icon_add.png",
                          height: 24,
                          width: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'search');
                        },
                        child: Image.asset(
                          "assets/icon_search.png",
                          color: kBlackColor,
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ],
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                        child:
                            TabDaftarKata(index: 0, title: "Indonesia-Bugis")),
                    Container(
                      height: 35,
                      width: 1,
                      color: kGreyColor,
                    ),
                    Expanded(
                        child:
                            TabDaftarKata(index: 1, title: "Bugis-Indonesia"))
                  ],
                ),
              ),
              // Expanded(
              //   child: BlocBuilder<TabDaftarKataSecondCubit, bool>(
              //     builder: (context, state) {
              //       if (state) {
              //         return const Center(child: CircularProgressIndicator());
              //       } else if (state is ListWordFailed) {
              //         return Center(child: Text(state.error));
              //       } else if (state is ListWordIndoSuccess) {
              //         return GroupedListView<dynamic, String>(
              //           elements: state.listWordModel,
              //           groupBy: (e) => e["Abjad_Indonesia"],
              //           order: GroupedListOrder.ASC,
              //           useStickyGroupSeparators: true,
              //           groupSeparatorBuilder: (String value) => Container(
              //             padding: const EdgeInsets.symmetric(vertical: 16),
              //             width: double.infinity,
              //             color: kWhiteColor,
              //             child: Text(
              //               value,
              //               style: const TextStyle(
              //                   fontSize: 20, fontWeight: FontWeight.bold),
              //             ),
              //           ),
              //           itemBuilder: (c, element) {
              //             return Column(
              //               children: [
              //                 CardItemListWordIndo(
              //                     bugis: element["Bugis"],
              //                     indo: element["Indonesia"]),
              //                 const SizedBox(
              //                   height: 16,
              //                 )
              //               ],
              //             );
              //           },
              //         );
              //       } else if (state is ListWordBugisSuccess) {
              //         return GroupedListView<dynamic, String>(
              //           elements: state.listWordModel,
              //           groupBy: (e) => e["Abjad_Bugis"],
              //           order: GroupedListOrder.ASC,
              //           useStickyGroupSeparators: true,
              //           groupSeparatorBuilder: (String value) => Container(
              //             padding: const EdgeInsets.symmetric(vertical: 16),
              //             width: double.infinity,
              //             color: kWhiteColor,
              //             child: Text(
              //               value,
              //               style: const TextStyle(
              //                   fontSize: 20, fontWeight: FontWeight.bold),
              //             ),
              //           ),
              //           itemBuilder: (c, element) {
              //             return Column(
              //               children: [
              //                 CardItemListWordBugis(
              //                     bugis: element["Bugis"],
              //                     indo: element["Indonesia"]),
              //                 const SizedBox(
              //                   height: 16,
              //                 )
              //               ],
              //             );
              //           },
              //         );
              //       } else {
              //         return const Text("Ada Kesalahan");
              //       }
              //     },
              //   ),
              // )
              Expanded(
                child: BlocBuilder<CheckListWordLocalCubit,
                    CheckListWordLocalState>(
                  builder: (context, state) {
                    if (state is CheckListWordLocalLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CheckListWordLocalFailed) {
                      return Center(child: Text(state.error));
                    } else if (state is CheckListWordIndoLocalSuccess) {
                      if (state.status == "Data Exist") {
                        List listWordIndo = [];
                        var myMap = listWordDataBox.toMap().values.toList();
                        listWordIndo = myMap;

                        return GroupedListView<dynamic, String>(
                          elements: listWordIndo,
                          groupBy: (e) => e["Abjad_Indonesia"],
                          order: GroupedListOrder.ASC,
                          useStickyGroupSeparators: true,
                          groupSeparatorBuilder: (String value) => Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            width: double.infinity,
                            color: kWhiteColor,
                            child: Text(
                              value,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          itemComparator: (item1, item2) =>
                              item1['Indonesia'].compareTo(item2['Indonesia']),
                          itemBuilder: (c, element) {
                            return Column(
                              children: [
                                CardItemListWordIndo(
                                    bugis: element["Bugis"],
                                    indo: element["Indonesia"]),
                                const SizedBox(
                                  height: 16,
                                )
                              ],
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: Text("Data Kosong !"),
                        );
                      }
                    } else if (state is CheckListWordBugisLocalSuccess) {
                      if (state.status == "Data Exist") {
                        List listWordBugis = [];
                        var myMap = listWordDataBox.toMap().values.toList();
                        listWordBugis = myMap;

                        return GroupedListView<dynamic, String>(
                          elements: listWordBugis,
                          groupBy: (e) => e["Abjad_Bugis"],
                          order: GroupedListOrder.ASC,
                          useStickyGroupSeparators: true,
                          groupSeparatorBuilder: (String value) => Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            width: double.infinity,
                            color: kWhiteColor,
                            child: Text(
                              value,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          itemComparator: (item1, item2) =>
                              item1['Bugis'].compareTo(item2['Bugis']),
                          itemBuilder: (c, element) {
                            return Column(
                              children: [
                                CardItemListWordBugis(
                                    bugis: element["Bugis"],
                                    indo: element["Indonesia"]),
                                const SizedBox(
                                  height: 16,
                                )
                              ],
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: Text("Data Kosong !"),
                        );
                      }
                    } else {
                      return const Text("Ada Kesalahan");
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
