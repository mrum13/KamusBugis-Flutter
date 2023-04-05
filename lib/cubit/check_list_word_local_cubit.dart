import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kamus_bugis/services/list_word_services.dart';

part 'check_list_word_local_state.dart';

class CheckListWordLocalCubit extends Cubit<CheckListWordLocalState> {
  CheckListWordLocalCubit() : super(CheckListWordLocalInitial());

  void checkListWordBugisLocal() async {
    try {
      emit(CheckListWordLocalLoading());

      String status = await ListWordServices().checkListWordData();

      emit(CheckListWordBugisLocalSuccess(status));
    } catch (e) {
      emit(CheckListWordLocalFailed(e.toString()));
    }
  }

  void checkListWordIndoLocal() async {
    try {
      emit(CheckListWordLocalLoading());

      String status = await ListWordServices().checkListWordData();

      emit(CheckListWordIndoLocalSuccess(status));
    } catch (e) {
      emit(CheckListWordLocalFailed(e.toString()));
    }
  }
}
