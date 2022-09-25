import 'package:flutter/material.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/primary_button.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

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
                    "Informasi",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(height: 24),
              PrimaryButton(title: "Tentang Aplikasi", onTap: () {}),
              const SizedBox(
                height: 16,
              ),
              PrimaryButton(
                  title: "Login Admin",
                  onTap: () {
                    Navigator.pushNamed(context, "login-admin");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
