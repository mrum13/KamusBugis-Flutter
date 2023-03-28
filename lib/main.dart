import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamus_bugis/cubit/auth_admin_cubit.dart';
import 'package:kamus_bugis/cubit/list_comparisson_cubit.dart';
import 'package:kamus_bugis/cubit/list_sentence_cubit.dart';
import 'package:kamus_bugis/cubit/list_word_cubit.dart';
import 'package:kamus_bugis/cubit/tab_daftar_kata_cubit.dart';
import 'package:kamus_bugis/cubit/tab_daftar_kata_second_cubit.dart';
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
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => TabDaftarKataCubit())),
        BlocProvider(create: ((context) => ListWordCubit())),
        BlocProvider(create: ((context) => ListSentenceCubit())),
        BlocProvider(create: ((context) => ListComparissonCubit())),
        BlocProvider(create: ((context) => AuthAdminCubit())),
        BlocProvider(create: ((context) => TabDaftarKataSecondCubit())),
      ],
      child: MaterialApp(
        initialRoute: 'home',
        routes: {
          '/': (context) => const SplashPage(),
          'home': (context) => const HomePage(),
          'search': (context) => const SearchPage(),
          'daftar-kata': (context) => const DaftarKataPage(),
          'kalimat': (context) => const KalimatPage(),
          'perbandingan': (context) => const PerbandinganKataPage(),
          'info': (context) => const InfoPage(),
          'login-admin': (context) => const LoginAdminPage(),
          'home-admin': (context) => const HomeAdminPage(),
          'list-kata-admin': (context) => const ListKataAdminPage(),
          'list-perbandingan-admin': (context) =>
              const ListPerbandinganKataAdminPage(),
          'list-kalimat-admin': (context) => const ListKalimatAdminPage(),
          'tambah-kata-admin': (context) => const TambahKataAdminPage(),
          'tambah-perbandingan-kata-admin': (context) =>
              const TambahPerbandinganKataAdminPage(),
          'tambah-kalimat-admin': (context) => const TambahKalimatAdminPage(),
        },
      ),
    );
  }
}
