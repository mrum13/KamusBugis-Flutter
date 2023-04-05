import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamus_bugis/cubit/check_sentence_local_cubit.dart';
import 'package:kamus_bugis/models/list_sentence.dart';
import 'package:kamus_bugis/services/list_sentence_services.dart';

part 'list_sentence_state.dart';

class ListSentenceCubit extends Cubit<ListSentenceState> {
  ListSentenceCubit() : super(ListSentenceInitial());

  void getListSentence() async {
    try {
      emit(ListSentenceLoading());

      bool status = await ListSentenceServices().fetchListSentence();
      emit(ListSentenceSuccess(status));
    } catch (e) {
      emit(ListSentenceFailed(e.toString()));
    }
  }

  void setSentence({required String bugis, required String indo}) async {
    try {
      emit(SetSentenceLoading());

      String message =
          await ListSentenceServices().setSentence(bugis: bugis, indo: indo);

      emit(SetSentenceSuccess(message));
    } catch (e) {
      emit(SetSentenceFailed(e.toString()));
    }
  }
}
