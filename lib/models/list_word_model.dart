import 'package:equatable/equatable.dart';

class ListWordModel extends Equatable {
  final String abjad;
  final String bugis;
  final String indonesia;

  ListWordModel(
      {required this.abjad, required this.bugis, required this.indonesia});

  factory ListWordModel.fromJson(String, Map<String, dynamic> json) =>
      ListWordModel(
        abjad: json['Abjad'],
        bugis: json['Bugis'],
        indonesia: json['Indonesia'],
      );

  @override
  List<Object> get props => [abjad, bugis, indonesia];
}
