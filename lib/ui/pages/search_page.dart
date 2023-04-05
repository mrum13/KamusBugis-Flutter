import 'package:flutter/material.dart';
import 'package:kamus_bugis/cubit/check_list_word_local_cubit.dart';
import 'package:kamus_bugis/cubit/list_word_cubit.dart';
import 'package:kamus_bugis/main.dart';
import 'package:kamus_bugis/shared/themes.dart';
import 'package:kamus_bugis/ui/widgets/card_item_list_kata_search_bugis.dart';
import 'package:kamus_bugis/ui/widgets/card_item_list_kata_search_indo.dart';
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

  final TextEditingController searchController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
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
                    // context.read<ListWordCubit>().getListWordIndoBugis();
                    context
                        .read<CheckListWordLocalCubit>()
                        .checkListWordIndoLocal();
                  } else {
                    // context.read<ListWordCubit>().getListWordBugisIndo();
                    context
                        .read<CheckListWordLocalCubit>()
                        .checkListWordBugisLocal();
                  }
                });
              },
            ),

            const SizedBox(height: 24),
            TextFormField(
              onFieldSubmitted: (String str) {
                setState(() {
                  searchController.text = str;
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
                      const BoxConstraints(maxWidth: 40, maxHeight: 44),
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
            BlocBuilder<CheckListWordLocalCubit, CheckListWordLocalState>(
              builder: (context, state) {
                if (state is CheckListWordLocalLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CheckListWordLocalFailed) {
                  return Center(
                    child: Text(state.error),
                  );
                } else if (state is CheckListWordIndoLocalSuccess) {
                  //binnary search function
                  int binarySearch(List arr, String x) {
                    int l = 0, r = arr.length - 1;

                    while (l <= r) {
                      double m = l + (r - l) / 2;

                      int res = x.compareTo(arr[m.round()]);

                      // Check if x is present at mid
                      if (res == 0) return m.round();

                      // If x greater, ignore left half
                      if (res > 0) l = m.round() + 1;

                      // If x is smaller, ignore right half
                      if (res < 0) r = m.round() - 1;
                    }

                    return -1;
                  }

                  if (textSearch == "") {
                    return const SizedBox();
                  } else {
                    String valueString = textSearch;

                    List listWordIndo = [];
                    var myMap = listWordDataBox.toMap().values.toList();
                    listWordIndo = myMap;

                    List listIndo =
                        listWordIndo.map((e) => e["Indonesia"]).toList();
                    List listIndoBugis = listWordIndo
                        .map((e) => "${e["Indonesia"]} |${e["Bugis"]}")
                        .toList();

                    listIndo.sort();
                    listIndoBugis.sort();

                    print("kata dicari : ${listIndoBugis}");

                    int result = binarySearch(listIndo, valueString);

                    if (result == -1) {
                      return const Center(
                        child: Text("Data tidak ada"),
                      );
                    } else {
                      var bugis = listIndoBugis.elementAt(result);
                      bugis.split('|').sublist(1).join(':').trim();

                      return CardItemListKataSearchIndo(
                        bugis: bugis.split('|').sublist(1).join(':').trim(),
                        indo: listIndo.elementAt(result),
                      );
                    }
                  }
                } else if (state is CheckListWordBugisLocalSuccess) {
                  //binnary search function
                  int binarySearch(List arr, String x) {
                    int l = 0, r = arr.length - 1;

                    while (l <= r) {
                      double m = l + (r - l) / 2;

                      int res = x.compareTo(arr[m.round()]);

                      // Check if x is present at mid
                      if (res == 0) return m.round();

                      // If x greater, ignore left half
                      if (res > 0) l = m.round() + 1;

                      // If x is smaller, ignore right half
                      if (res < 0) r = m.round() - 1;
                    }

                    return -1;
                  }

                  if (textSearch == "") {
                    return const SizedBox();
                  } else {
                    List listWordBugis = [];
                    var myMap = listWordDataBox.toMap().values.toList();
                    listWordBugis = myMap;

                    String valueString = textSearch;
                    List listBugis =
                        listWordBugis.map((e) => e["Bugis"]).toList();
                    List listBugisIndo = listWordBugis
                        .map((e) => "${e["Bugis"]} |${e["Indonesia"]}")
                        .toList();

                    listBugis.sort();
                    listBugisIndo.sort();

                    int result = binarySearch(listBugis, valueString);

                    if (result == -1) {
                      return const Center(
                        child: Text("Data tidak ada"),
                      );
                    } else {
                      var indo = listBugisIndo.elementAt(result);
                      indo.split('|').sublist(1).join(':').trim();

                      return CardItemListKataSearchBugis(
                          bugis: listBugis.elementAt(result),
                          indo: indo.split('|').sublist(1).join(':').trim());
                    }
                  }
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
