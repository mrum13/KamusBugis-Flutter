import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class TabDaftarKataSecondCubit extends Cubit<bool> {
  TabDaftarKataSecondCubit() : super(false);

  void setPage(bool bool) {
    emit(bool);
  }
}
