import 'package:equatable/equatable.dart';

class ListWordModel extends Equatable {
  final String abjadBugis;
  final String abjadIndonesia;
  final String bugis;
  final String indonesia;

  ListWordModel(
      {required this.abjadBugis,
      required this.abjadIndonesia,
      required this.bugis,
      required this.indonesia});

  factory ListWordModel.fromJson(String, Map<String, dynamic> json) =>
      ListWordModel(
        abjadBugis: json['Abjad_Bugis'],
        abjadIndonesia: json['Abjad_Indonesia'],
        bugis: json['Bugis'],
        indonesia: json['Indonesia'],
      );

  @override
  List<Object> get props => [abjadBugis, abjadIndonesia, bugis, indonesia];
}
