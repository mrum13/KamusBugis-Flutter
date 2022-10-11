import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kamus_bugis/models/list_word_model.dart';
import 'package:kamus_bugis/services/list_word_services.dart';

part 'list_word_state.dart';

class ListWordCubit extends Cubit<ListWordState> {
  ListWordCubit() : super(ListWordInitial());

  void getListWordIndoBugis() async {
    try {
      emit(ListWordLoading());

      List<ListWordModel> listWord =
          await ListWordServices().fetchListWordIndoBugis();
      emit(ListWordIndoSuccess(listWord));
    } catch (e) {
      emit(ListWordFailed(e.toString()));
    }
  }

  void getListWordBugisIndo() async {
    try {
      emit(ListWordLoading());

      List<ListWordModel> listWord =
          await ListWordServices().fetchListWordIndoBugis();
      emit(ListWordBugisSuccess(listWord));
    } catch (e) {
      emit(ListWordFailed(e.toString()));
    }
  }

  void setWord(
      {required String bugis,
      required String indo,
      required String abjadBugis,
      required String abjadIndo}) async {
    try {
      emit(SetWordLoading());

      String message = await ListWordServices().setWord(
          bugis: bugis,
          indo: indo,
          abjadBugis: abjadBugis,
          abjadIndo: abjadIndo);

      emit(SetWordSuccess(message));
    } catch (e) {
      emit(SetWordFailed(e.toString()));
    }
  }
}
