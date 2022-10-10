import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kamus_bugis/models/list_comparisson_word_model.dart';
import 'package:kamus_bugis/services/list_comparisson_word_service.dart';

part 'list_comparisson_state.dart';

class ListComparissonCubit extends Cubit<ListComparissonState> {
  ListComparissonCubit() : super(ListComparissonInitial());

  void getListComparisson() async {
    try {
      emit(ListComparissonLoading());

      List<ListComparissonModel> listComparisson =
          await ListComparissonWordServices().fetchComparissonWord();
      emit(ListComparissonSuccess(listComparisson));
    } catch (e) {
      emit(ListComparissonFailed(e.toString()));
    }
  }
}
