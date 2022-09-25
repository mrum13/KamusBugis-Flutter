import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamus_bugis/cubit/tab_daftar_kata_cubit.dart';
import 'package:kamus_bugis/ui/pages/admin_pages/home_admin_page.dart';
import 'package:kamus_bugis/ui/pages/admin_pages/list_kalimat_admin_page.dart';
import 'package:kamus_bugis/ui/pages/admin_pages/list_kata_admin_page.dart';
import 'package:kamus_bugis/ui/pages/admin_pages/list_perbandingan_kata_admin_page.dart';
import 'package:kamus_bugis/ui/pages/admin_pages/tambah_kalimat_admin_page.dart';
import 'package:kamus_bugis/ui/pages/admin_pages/tambah_kata_admin_page.dart';
import 'package:kamus_bugis/ui/pages/admin_pages/tambah_perbandingan_kata_admin_page.dart';
import 'package:kamus_bugis/ui/pages/daftar_kata_page.dart';
import 'package:kamus_bugis/ui/pages/home_page.dart';
import 'package:kamus_bugis/ui/pages/info_page.dart';
import 'package:kamus_bugis/ui/pages/kalimat_page.dart';
import 'package:kamus_bugis/ui/pages/admin_pages/login_admin_page.dart';
import 'package:kamus_bugis/ui/pages/perbandingan_kata_page.dart';
import 'package:kamus_bugis/ui/pages/search_page.dart';
import 'package:kamus_bugis/ui/pages/splash_page.dart';
import 'package:kamus_bugis/ui/widgets/tab_daftar_kata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => TabDaftarKataCubit())),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const SplashPage(),
          'home': (context) => HomePage(),
          'search': (context) => SearchPage(),
          'daftar-kata': (context) => DaftarKataPage(),
          'kalimat': (context) => KalimatPage(),
          'perbandingan': (context) => PerbandinganKataPage(),
          'info': (context) => InfoPage(),
          'login-admin': (context) => LoginAdminPage(),
          'home-admin': (context) => HomeAdminPage(),
          'list-kata-admin': (context) => ListKataAdminPage(),
          'list-perbandingan-admin': (context) =>
              ListPerbandinganKataAdminPage(),
          'list-kalimat-admin': (context) => ListKalimatAdminPage(),
          'tambah-kata-admin': (context) => TambahKataAdminPage(),
          'tambah-perbandingan-kata-admin': (context) =>
              TambahPerbandinganKataAdminPage(),
          'tambah-kalimat-admin': (context) => TambahKalimatAdminPage(),
        },
      ),
    );
  }
}
