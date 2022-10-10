import 'package:equatable/equatable.dart';

class ListComparissonModel extends Equatable {
  final String bugisPinrang;
  final String bugisUmum;
  final String indonesia;

  ListComparissonModel(
      {required this.bugisPinrang,
      required this.bugisUmum,
      required this.indonesia});

  factory ListComparissonModel.fromJson(String, Map<String, dynamic> json) =>
      ListComparissonModel(
        bugisPinrang: json['Bugis_Pinrang'],
        bugisUmum: json['Bugis_Umum'],
        indonesia: json['Indonesia'],
      );

  @override
  List<Object> get props => [bugisPinrang, bugisUmum, indonesia];
}
