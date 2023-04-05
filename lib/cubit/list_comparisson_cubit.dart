import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kamus_bugis/models/list_comparisson_word.dart';
import 'package:kamus_bugis/services/list_comparisson_word_service.dart';

part 'list_comparisson_state.dart';

class ListComparissonCubit extends Cubit<ListComparissonState> {
  ListComparissonCubit() : super(ListComparissonInitial());

  void getListComparisson() async {
    try {
      emit(ListComparissonLoading());

      bool listComparisson =
          await ListComparissonWordServices().fetchComparissonWord();
      emit(ListComparissonSuccess(listComparisson));
    } catch (e) {
      emit(ListComparissonFailed(e.toString()));
    }
  }

  void setComparisson(
      {required String bugisUmum,
      required String bugisPinrang,
      required String indo}) async {
    try {
      emit(SetComparissonLoading());

      String message = await ListComparissonWordServices().setComparisson(
          bugisPinrang: bugisPinrang, bugisUmum: bugisUmum, indo: indo);

      emit(SetComparissonSuccess(message));
    } catch (e) {
      emit(SetComparissonFailed(e.toString()));
    }
  }
}
