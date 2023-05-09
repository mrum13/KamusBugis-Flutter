import 'package:flutter/material.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/primary_button.dart';

class DialogFailedAddData extends StatelessWidget {
  final String kata;

  const DialogFailedAddData({
    required this.kata,
    super.key, 

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle_outlined,size: 94, color: kPrimaryColor,),
          
          const SizedBox(
            height: 16,
          ),
          Text(
            'Gagal menambahkan $kata',
            textAlign: TextAlign.center,
            style: blackTextStyle.copyWith(
                fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PrimaryButton(
                  title: "OK", 
                  onTap: () {
                    Navigator.pop(context);
                  }
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
