import 'package:flutter/material.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/primary_button.dart';

class DialogLoadingAddData extends StatelessWidget {

  const DialogLoadingAddData({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.all(16),
      child: Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}
