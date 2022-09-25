import 'package:flutter/material.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/card_item_list_perbandingan.dart';

class PerbandinganKataPage extends StatelessWidget {
  const PerbandinganKataPage({Key? key}) : super(key: key);

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
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    CardItemListPerbandingan(),
                    const SizedBox(
                      height: 8,
                    ),
                    CardItemListPerbandingan(),
                    const SizedBox(
                      height: 8,
                    ),
                    CardItemListPerbandingan(),
                    const SizedBox(
                      height: 8,
                    ),
                    CardItemListPerbandingan(),
                    const SizedBox(
                      height: 8,
                    ),
                    CardItemListPerbandingan(),
                    const SizedBox(
                      height: 8,
                    ),
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
