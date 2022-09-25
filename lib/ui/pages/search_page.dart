import 'package:flutter/material.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/card_item_list_kata.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController =
        TextEditingController(text: '');

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Noted: Header
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
                  width: 4,
                ),
                Text(
                  "Pencarian",
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w400),
                )
              ],
            ),

            const SizedBox(height: 24),
            TextFormField(
              maxLines: 1,
              style: blackTextStyle.copyWith(
                  fontSize: 12, fontWeight: FontWeight.w400),
              cursorColor: kBlackColor,
              controller: searchController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  filled: true,
                  prefixIconConstraints:
                      BoxConstraints(maxWidth: 40, maxHeight: 44),
                  prefixIcon: IconButton(
                      icon: Image.asset(
                        "assets/icon_search.png",
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {}),
                  fillColor: kWhiteColor,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  hintText: "Cari kata apa ???",
                  hintStyle: greyTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w400),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: kGreyColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: kPrimaryColor))),
            ),

            const SizedBox(
              height: 24,
            ),
            CardItemListKata()
          ],
        ),
      )),
    );
  }
}
