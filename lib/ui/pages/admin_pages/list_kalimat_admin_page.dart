import 'package:flutter/material.dart';
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
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  // CardKalimat(
                  //     bugis: "Pura ki mandre ?", indo: "Kamu sudah makan ?"),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  // CardKalimat(
                  //     bugis: "Pura ki mandre ?", indo: "Kamu sudah makan ?"),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  // CardKalimat(
                  //     bugis: "Pura ki mandre ?", indo: "Kamu sudah makan ?"),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  // CardKalimat(
                  //     bugis: "Pura ki mandre ?", indo: "Kamu sudah makan ?"),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  // CardKalimat(
                  //     bugis: "Pura ki mandre ?", indo: "Kamu sudah makan ?"),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
