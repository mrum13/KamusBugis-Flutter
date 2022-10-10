import 'package:flutter/material.dart';
import 'package:kamus_bugis/cubit/list_word_cubit.dart';
import 'package:kamus_bugis/models/list_word_model.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/card_item_list_kata.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String dropdownvalue = 'Bahasa Indonesia';

  String textSearch = "";

  // List of items in our dropdown menu
  var items = [
    'Bahasa Indonesia',
    'Bahasa Bugis',
  ];

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
            const SizedBox(
              height: 24,
            ),

            DropdownButton(
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                  if (dropdownvalue == "Bahasa Indonesia") {
                    context.read<ListWordCubit>().getListWordIndoBugis();
                  } else {
                    context.read<ListWordCubit>().getListWordBugisIndo();
                  }
                });
              },
            ),

            const SizedBox(height: 24),
            TextFormField(
              onFieldSubmitted: (String str) {
                setState(() {
                  textSearch = str;
                });
              },
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
            BlocBuilder<ListWordCubit, ListWordState>(
              builder: (context, state) {
                if (state is ListWordLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ListWordFailed) {
                  return Center(
                    child: Text(state.error),
                  );
                } else if (state is ListWordIndoSuccess) {
                  int binarySearch(List<String> arr, String x) {
                    int l = 0, r = arr.length - 1;
                    while (l <= r) {
                      double m = l + (r - l) / 2;

                      int res = x.compareTo(arr[m.round()]);

                      // Check if x is present at mid
                      if (res == 0) return m.round();

                      // If x greater, ignore left half
                      if (res > 0)
                        l = m.round() + 1;

                      // If x is smaller, ignore right half
                      else
                        r = m.round() - 1;
                    }

                    return -1;
                  }

                  if (textSearch == "") {
                    return SizedBox();
                  } else {
                    List<String> listWord =
                        state.listWordModel.map((e) => e.indonesia).toList();
                    String valueString = textSearch;
                    int result = binarySearch(listWord, valueString);

                    if (result == -1) {
                      return const Center(
                        child: Text("Data tidak ada"),
                      );
                    } else {
                      return CardItemListKata(
                        bugis: state.listWordModel.elementAt(result).bugis,
                        indo: state.listWordModel.elementAt(result).indonesia,
                      );
                    }
                  }
                } else if (state is ListWordBugisSuccess) {
                  List<ListWordModel> listWord = state.listWordModel;

                  print(listWord);

                  return SizedBox();
                } else {
                  return const Center(
                    child: Text("Ada Kesalahan"),
                  );
                }
              },
            )
          ],
        ),
      )),
    );
  }
}
