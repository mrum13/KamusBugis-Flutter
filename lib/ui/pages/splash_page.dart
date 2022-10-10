import 'package:flutter/material.dart';
import 'package:kamus_bugis/cubit/list_sentence_cubit.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Image.asset(
                    "assets/icon_logo.png",
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 84,
                  ),
                  PrimaryButton(
                      title: "Ayo Mulai",
                      onTap: () {
                        Navigator.pushNamed(context, 'home');
                      }),
                  const SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "login-admin");
                    },
                    child: Text(
                      "Masuk sebagai admin",
                      style: blackTextStyle.copyWith(
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
