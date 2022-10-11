import 'package:flutter/material.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/form_input.dart';

class FormInputWithTitle extends StatelessWidget {
  final String hint, title;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscureText;

  const FormInputWithTitle({
    Key? key,
    required this.title,
    required this.controller,
    required this.hint,
    required this.textInputType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blackTextStyle.copyWith(
              fontSize: 12, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 4,
        ),
        FormInput(
            obscureText: obscureText,
            controller: controller,
            textInputType: textInputType,
            hint: hint)
      ],
    );
  }
}
