import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamus_bugis/cubit/auth_admin_cubit.dart';
import 'package:kamus_bugis/cubit/list_comparisson_cubit.dart';
import 'package:kamus_bugis/cubit/list_sentence_cubit.dart';
import 'package:kamus_bugis/cubit/list_word_cubit.dart';
import 'package:kamus_bugis/services/list_sentence_services.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/form_input_with_title.dart';
import 'package:kamus_bugis/ui/widgets/primary_button.dart';

class LoginAdminPage extends StatelessWidget {
  const LoginAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController =
        TextEditingController(text: '');
    final TextEditingController passwordController =
        TextEditingController(text: '');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Image.asset(
              "assets/icon_logo.png",
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              "Admin",
              style: blackTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 24,
            ),
            FormInputWithTitle(
                title: "Email",
                controller: emailController,
                hint: "Masukkan Email",
                textInputType: TextInputType.emailAddress),
            const SizedBox(
              height: 12,
            ),
            FormInputWithTitle(
                obscureText: true,
                title: "Password",
                controller: passwordController,
                hint: "Masukkan Password",
                textInputType: TextInputType.text),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'home');
              },
              child: Text(
                "Masuk sebagai pengguna",
                style: blackTextStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            const Expanded(child: const SizedBox()),
            BlocConsumer<AuthAdminCubit, AuthAdminState>(
              listener: (context, state) {
                if (state is AuthAdminSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(state.message)));

                  Navigator.pushNamedAndRemoveUntil(
                      context, 'home-admin', (route) => false);
                } else if (state is AuthAdminFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red, content: Text(state.error)));
                }
              },
              builder: (context, state) {
                if (state is AuthAdminLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return PrimaryButton(
                    title: "Masuk",
                    onTap: () {
                      context.read<AuthAdminCubit>().signIn(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                    });
              },
            )
          ],
        ),
      )),
    );
  }
}
