import 'package:hive/hive.dart';

part 'list_word.g.dart';

@HiveType(typeId: 1)
class ListWord {
  @HiveField(0)
  final String abjadBugis;
  @HiveField(1)
  final String abjadIndonesia;
  @HiveField(2)
  final String bugis;
  @HiveField(3)
  final String indonesia;

  ListWord(
      {required this.abjadBugis,
      required this.abjadIndonesia,
      required this.bugis,
      required this.indonesia});
}
