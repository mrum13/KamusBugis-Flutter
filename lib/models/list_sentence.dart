import 'package:hive/hive.dart';

part 'list_sentence.g.dart';

@HiveType(typeId: 1)
class ListSentence {
  @HiveField(0)
  final String bugis;
  @HiveField(1)
  final String indonesia;

  ListSentence({required this.bugis, required this.indonesia});
}
