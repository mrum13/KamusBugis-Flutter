import 'package:flutter/material.dart';
import 'package:kamus_bugis/shared/themes.dart';

class PrimaryButton extends StatelessWidget {
  final double width, height;
  final String title;
  final Function() onTap;

  const PrimaryButton({
    Key? key,
    required this.title,
    this.height = 44.0,
    this.width = double.infinity,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(4)),
        child: Center(
          child: Text(
            title,
            style: whiteTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
