import 'package:flutter/material.dart';
import 'package:kamus_bugis/cubit/list_comparisson_cubit.dart';
import 'package:kamus_bugis/models/list_comparisson_word_model.dart';
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
              Expanded(child:
                  BlocBuilder<ListComparissonCubit, ListComparissonState>(
                builder: (context, state) {
                  if (state is ListComparissonLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ListComparissonFailed) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else if (state is ListComparissonSuccess) {
                    return SingleChildScrollView(
                      child: Column(
                        children: state.listComparisson
                            .map((ListComparissonModel listComparisson) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              CardItemListPerbandingan(listComparisson)
                            ],
                          );
                        }).toList(),
                      ),
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
        ),
      ),
    );
  }
}
