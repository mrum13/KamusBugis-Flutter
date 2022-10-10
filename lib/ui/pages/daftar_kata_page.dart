import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamus_bugis/cubit/list_word_cubit.dart';
import 'package:kamus_bugis/models/list_word_model.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/card_item_list_word_bugis.dart';
import 'package:kamus_bugis/ui/widgets/card_item_list_word_indo.dart';
import 'package:kamus_bugis/ui/widgets/tab_daftar_kata.dart';

class DaftarKataPage extends StatelessWidget {
  const DaftarKataPage({Key? key}) : super(key: key);

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
                        "Daftar Kata",
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'search');
                    },
                    child: Image.asset(
                      "assets/icon_search.png",
                      height: 24,
                      width: 24,
                    ),
                  ),
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
              Expanded(
                child: BlocBuilder<ListWordCubit, ListWordState>(
                  builder: (context, state) {
                    if (state is ListWordLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ListWordFailed) {
                      return Center(child: Text(state.error));
                    } else if (state is ListWordIndoSuccess) {
                      return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: state.listWordModel
                                .map((ListWordModel listWord) {
                              return CardItemListWordIndo(listWord);
                            }).toList(),
                          ));
                    } else if (state is ListWordBugisSuccess) {
                      return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: state.listWordModel
                                .map((ListWordModel listWord) {
                              return CardItemListWordBugis(listWord);
                            }).toList(),
                          ));
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
