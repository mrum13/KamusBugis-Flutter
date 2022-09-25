import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class TabDaftarKataCubit extends Cubit<int> {
  TabDaftarKataCubit() : super(0);

  void setTab(int index) {
    emit(index);
  }
}
