import 'package:flutter/material.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/tab_daftar_kata.dart';

class ListKataAdminPage extends StatelessWidget {
  const ListKataAdminPage({Key? key}) : super(key: key);

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
                        "Daftar Kata",
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "tambah-kata-admin");
                        },
                        child: Image.asset(
                          "assets/icon_add.png",
                          height: 24,
                          width: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Image.asset(
                        "assets/icon_search.png",
                        color: kBlackColor,
                        height: 24,
                        width: 24,
                      ),
                    ],
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                        child:
                            TabDaftarKata(index: 0, title: "Indonesia-Bugis")),
                    Container(
                      height: 35,
                      width: 1,
                      color: kGreyColor,
                    ),
                    Expanded(
                        child:
                            TabDaftarKata(index: 1, title: "Bugis-Indonesia"))
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
