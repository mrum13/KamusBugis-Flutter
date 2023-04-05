import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kamus_bugis/services/list_comparisson_word_service.dart';

part 'check_compare_word_local_state.dart';

class CheckCompareWordLocalCubit extends Cubit<CheckCompareWordLocalState> {
  CheckCompareWordLocalCubit() : super(CheckCompareWordLocalInitial());

  void checkCompareWordLocal() async {
    try {
      emit(CheckCompareWordLocalLoading());

      String status =
          await ListComparissonWordServices().checkListComparissonWordData();

      emit(CheckCompareWordLocalSuccess(status));
    } catch (e) {
      emit(CheckCompareWordLocalFailed(e.toString()));
    }
  }
}
