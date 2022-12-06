import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamus_bugis/cubit/list_word_cubit.dart';
import 'package:kamus_bugis/cubit/tab_daftar_kata_cubit.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/form_input_with_title.dart';
import 'package:kamus_bugis/ui/widgets/primary_button.dart';

class TambahKataAdminPage extends StatelessWidget {
  const TambahKataAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController indoController =
        TextEditingController(text: '');
    final TextEditingController bugisController =
        TextEditingController(text: '');

    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(children: [
                  //Noted: Header
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "list-kata-admin");
                          context.read<TabDaftarKataCubit>().setTab(0);
                          context.read<ListWordCubit>().getListWordIndoBugis();
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
                        "Tambah Kata Bugis",
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(height: 24),
                  FormInputWithTitle(
                      title: "Bahasa Indonesia",
                      controller: indoController,
                      hint: "Masukkan kata Bahasa Indonesia",
                      textInputType: TextInputType.text),
                  const SizedBox(
                    height: 12,
                  ),
                  FormInputWithTitle(
                      title: "Bahasa Bugis",
                      controller: bugisController,
                      hint: "Masukkan kata Bahasa Bugis",
                      textInputType: TextInputType.text),
                  Expanded(child: const SizedBox()),
                  BlocConsumer<ListWordCubit, ListWordState>(
                    listener: (context, state) {
                      if (state is SetWordFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(state.error)));
                      } else if (state is SetWordSuccess) {
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //     duration: const Duration(seconds: 2),
                        //     backgroundColor: Colors.green,
                        //     content: Text(state.message)));
                        Navigator.pushNamed(context, "list-kata-admin");
                        context.read<TabDaftarKataCubit>().setTab(0);
                        context.read<ListWordCubit>().getListWordIndoBugis();
                      }
                    },
                    builder: (context, state) {
                      if (state is SetWordLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return PrimaryButton(
                          title: "Tambah Kata",
                          onTap: () {
                            if (indoController.text == '' &&
                                bugisController.text == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text("Mohon lengkapi form !")));
                            } else {
                              context.read<ListWordCubit>().setWord(
                                  bugis: bugisController.text.toLowerCase(),
                                  indo: indoController.text.toLowerCase(),
                                  abjadBugis:
                                      bugisController.text[0].toUpperCase(),
                                  abjadIndo:
                                      indoController.text[0].toUpperCase());
                            }
                          });
                    },
                  )
                ]))));
  }
}
