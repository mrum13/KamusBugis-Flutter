import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamus_bugis/cubit/list_sentence_cubit.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/dialog_failed_add_data.dart';
import 'package:kamus_bugis/ui/widgets/dialog_loading_add_data.dart';
import 'package:kamus_bugis/ui/widgets/dialog_success_add_data.dart';
import 'package:kamus_bugis/ui/widgets/form_input_with_title.dart';
import 'package:kamus_bugis/ui/widgets/primary_button.dart';

class TambahKalimatAdminPage extends StatelessWidget {
  const TambahKalimatAdminPage({Key? key}) : super(key: key);

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
                          Navigator.pushNamed(context, "list-kalimat-admin");
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
                        "Tambah Kalimat Bugis",
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
                      hint: "Masukkan kalimat Bahasa Indonesia",
                      textInputType: TextInputType.text),
                  const SizedBox(
                    height: 12,
                  ),
                  FormInputWithTitle(
                      title: "Bahasa Bugis",
                      controller: bugisController,
                      hint: "Masukkan kalimat Bahasa Bugis",
                      textInputType: TextInputType.text),
                  Expanded(child: const SizedBox()),
                  PrimaryButton(
                      title: "Tambah Kalimat",
                      onTap: () {
                        if (indoController.text == '' &&
                            bugisController.text == '') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("Mohon lengkapi form !")));
                        } else {
                          context.read<ListSentenceCubit>().setSentence(
                              bugis: bugisController.text,
                              indo: indoController.text);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                insetPadding: const EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                child: BlocBuilder<ListSentenceCubit,
                                    ListSentenceState>(
                                  builder: (context, state) {
                                    if (state is SetSentenceSuccess) {
                                      return DialogSuccessAddData(
                                        kata: "Kalimat",
                                      );
                                    } else if (state is SetSentenceFailed) {
                                      return DialogFailedAddData(
                                          kata: "Kalimat");
                                    } else if (state is SetSentenceLoading) {
                                      return DialogLoadingAddData();
                                    } else {
                                      return DialogFailedAddData(kata: "");
                                    }
                                  },
                                ),
                              );
                            },
                          );
                        }
                      })
                ]))));
  }
}
