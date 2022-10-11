import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamus_bugis/cubit/list_sentence_cubit.dart';
import 'package:kamus_bugis/models/list_sentence_model.dart';
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
            Expanded(child: BlocBuilder<ListSentenceCubit, ListSentenceState>(
              builder: (context, state) {
                if (state is ListSentenceLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ListSentenceFailed) {
                  return Center(
                    child: Text(state.error),
                  );
                } else if (state is ListSentenceSuccess) {
                  return SingleChildScrollView(
                    child: Column(
                      children: state.listSentence
                          .map((ListSentenceModel listSentence) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            CardKalimat(listSentence),
                          ],
                        );
                      }).toList(),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("Ada kesalahan"),
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
