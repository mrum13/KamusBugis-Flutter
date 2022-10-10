import 'package:equatable/equatable.dart';

class ListSentenceModel extends Equatable {
  final String bugis;
  final String indonesia;

  ListSentenceModel({required this.bugis, required this.indonesia});

  factory ListSentenceModel.fromJson(String, Map<String, dynamic> json) =>
      ListSentenceModel(
        bugis: json['Bugis'],
        indonesia: json['Indonesia'],
      );

  @override
  List<Object> get props => [bugis, indonesia];
}
