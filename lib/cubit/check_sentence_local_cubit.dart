import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kamus_bugis/services/list_sentence_services.dart';

part 'check_sentence_local_state.dart';

class CheckSentenceLocalCubit extends Cubit<CheckSentenceLocalState> {
  CheckSentenceLocalCubit() : super(CheckSentenceLocalInitial());

  void checkSentenceLocal() async {
    try {
      emit(CheckSentenceLocalLoading());

      String status = await ListSentenceServices().checkListSentenceData();

      emit(CheckSentenceLocalSuccess(status));
    } catch (e) {
      emit(CheckSentenceLocalFailed(e.toString()));
    }
  }
}
