import 'package:flutter/material.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/card_kalimat.dart';
import 'package:kamus_bugis/ui/widgets/card_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Noted: Header
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icon_logo.png",
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: Text(
                      "Belajar bahasa bugis jadi lebih mudah dan cepat",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    )),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "info");
                          },
                          child: Image.asset(
                            "assets/icon_info.png",
                            height: 24,
                            width: 24,
                          ),
                        )
                      ],
                    )
                  ],
                ),

                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "search");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        color: kCardColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mau cari kata apa ???",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: kWhiteColor,
                              border: Border.all(color: kGreyColor),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/icon_search.png",
                                height: 24,
                                width: 24,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Pelajari bahasa bugis",
                  style: blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardMenu(
                        index: 0,
                        icon: "assets/icon_daftar_kata.png",
                        title: "Daftar Kata"),
                    CardMenu(
                        index: 1,
                        icon: "assets/icon_kalimat.png",
                        title: "Kalimat"),
                    CardMenu(
                        index: 2,
                        icon: "assets/icon_perbandingan kata.png",
                        title: "Perbandingan Kata"),
                  ],
                ),

                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Bahasa bugis untuk hari ini",
                  style: blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 14,
                ),
                CardKalimat(
                  bugis: "Pura ki mandre ?",
                  indo: "Kamu sudah makan ?",
                ),
                const SizedBox(
                  height: 8,
                ),
                CardKalimat(
                  bugis: "Pura ki mandre ?",
                  indo: "Kamu sudah makan ?",
                ),
                const SizedBox(
                  height: 8,
                ),
                CardKalimat(
                  bugis: "Pura ki mandre ?",
                  indo: "Kamu sudah makan ?",
                ),
                const SizedBox(
                  height: 8,
                ),
                CardKalimat(
                  bugis: "Pura ki mandre ?",
                  indo: "Kamu sudah makan ?",
                ),
                const SizedBox(
                  height: 8,
                ),
                CardKalimat(
                  bugis: "Pura ki mandre ?",
                  indo: "Kamu sudah makan ?",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
