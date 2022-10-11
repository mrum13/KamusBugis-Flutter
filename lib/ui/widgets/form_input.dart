import 'package:flutter/material.dart';
import 'package:kamus_bugis/shared/themes.dart';

class FormInput extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String hint;
  final bool obscureText;

  const FormInput({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.hint,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: true,
      obscureText: obscureText,
      scrollPadding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      maxLines: 1,
      style: blackTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
      cursorColor: kBlackColor,
      controller: controller,
      keyboardType: textInputType,
      validator: (value) {
        if (value == null || value.isEmpty || value == '') {
          return 'Mohon isi form !';
        }
        return null;
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: kWhiteColor,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14.0),
          hintText: hint,
          hintStyle:
              greyTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color.fromRGBO(215, 215, 215, 1),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: kPrimaryColor))),
    );
  }
}
