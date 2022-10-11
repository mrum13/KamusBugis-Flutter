import 'package:flutter/material.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/card_home_admin.dart';

class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
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
                          Navigator.pushNamed(context, "login-admin");
                        },
                        child: Image.asset(
                          "assets/icon_logout.png",
                          height: 24,
                          width: 24,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                "Selamat datang admin",
                style: blackTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 14,
              ),
              CardHomeAdmin(
                image: "assets/icon_daftar_kata.png",
                index: 0,
                title: "Tambah Daftar Kata",
              ),
              const SizedBox(
                height: 24,
              ),
              CardHomeAdmin(
                image: "assets/icon_perbandingan kata.png",
                index: 1,
                title: "Tambah Perbandingan Kata",
              ),
              const SizedBox(
                height: 24,
              ),
              CardHomeAdmin(
                image: "assets/icon_kalimat.png",
                index: 2,
                title: "Tambah Kalimat",
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
