import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamus_bugis/cubit/list_comparisson_cubit.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/form_input_with_title.dart';
import 'package:kamus_bugis/ui/widgets/primary_button.dart';

class TambahPerbandinganKataAdminPage extends StatelessWidget {
  const TambahPerbandinganKataAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController indoController =
        TextEditingController(text: '');
    final TextEditingController bugisPinrangController =
        TextEditingController(text: '');
    final TextEditingController bugisUmumController =
        TextEditingController(text: '');

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(children: [
                  //Noted: Header
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, "list-perbandingan-admin");
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
                        "Tambah Perbandingan Kata Bugis",
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
                      title: "Bahasa Bugis Pinrang",
                      controller: bugisPinrangController,
                      hint: "Masukkan kata Bahasa Bugis Pirang",
                      textInputType: TextInputType.text),
                  const SizedBox(
                    height: 12,
                  ),
                  FormInputWithTitle(
                      title: "Bahasa Bugis Umum",
                      controller: bugisUmumController,
                      hint: "Masukkan kata Bahasa Bugis Umum",
                      textInputType: TextInputType.text),
                  Expanded(child: const SizedBox()),
                  BlocConsumer<ListComparissonCubit, ListComparissonState>(
                    listener: (context, state) {
                      if (state is SetComparissonFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(state.error)));
                      } else if (state is SetComparissonSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(state.message)));
                        context
                            .read<ListComparissonCubit>()
                            .getListComparisson();
                        Navigator.pushNamed(context, 'list-perbandingan-admin');
                      }
                    },
                    builder: (context, state) {
                      if (state is SetComparissonLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return PrimaryButton(
                          title: "Tambah Perbandingan Kata",
                          onTap: () {
                            if (indoController.text == '' &&
                                bugisUmumController.text == '' &&
                                bugisPinrangController.text == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text("Mohon lengkapi form !")));
                            } else {
                              context
                                  .read<ListComparissonCubit>()
                                  .setComparisson(
                                      bugisPinrang: bugisPinrangController.text,
                                      bugisUmum: bugisUmumController.text,
                                      indo: indoController.text);
                            }
                          });
                    },
                  )
                ]))));
  }
}
