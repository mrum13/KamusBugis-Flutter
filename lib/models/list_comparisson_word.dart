import 'package:hive/hive.dart';

part 'list_comparisson_word.g.dart';

@HiveType(typeId: 1)
class ListComparissonWord {
  @HiveField(0)
  final String bugisPinrang;
  @HiveField(1)
  final String bugisUmum;
  @HiveField(2)
  final String indonesia;

  ListComparissonWord(
      {required this.bugisPinrang,
      required this.bugisUmum,
      required this.indonesia});
}
