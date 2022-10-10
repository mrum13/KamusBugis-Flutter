import 'package:flutter/material.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/card_item_list_perbandingan.dart';

class ListPerbandinganKataAdminPage extends StatelessWidget {
  const ListPerbandinganKataAdminPage({Key? key}) : super(key: key);

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
                        "Perbandingan Kata bugis",
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, "tambah-perbandingan-kata-admin");
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
                    // CardItemListPerbandingan(),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // CardItemListPerbandingan(),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // CardItemListPerbandingan(),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // CardItemListPerbandingan(),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // CardItemListPerbandingan(),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}