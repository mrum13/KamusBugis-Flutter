part of 'list_sentence_cubit.dart';

abstract class ListSentenceState extends Equatable {
  const ListSentenceState();

  @override
  List<Object> get props => [];
}

class ListSentenceInitial extends ListSentenceState {}

class ListSentenceLoading extends ListSentenceState {}

class ListSentenceSuccess extends ListSentenceState {
  final List<ListSentenceModel> listSentence;

  ListSentenceSuccess(this.listSentence);

  @override
  // TODO: implement props
  List<Object> get props => [listSentence];
}

class ListSentenceFailed extends ListSentenceState {
  final String error;

  ListSentenceFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

class SetSentenceLoading extends ListSentenceState {}

class SetSentenceSuccess extends ListSentenceState {
  final String message;

  SetSentenceSuccess(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class SetSentenceFailed extends ListSentenceState {
  final String error;

  SetSentenceFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
