part of 'list_word_cubit.dart';

abstract class ListWordState extends Equatable {
  const ListWordState();

  @override
  List<Object> get props => [];
}

class ListWordInitial extends ListWordState {}

class ListWordLoading extends ListWordState {}

class ListWordIndoSuccess extends ListWordState {
  final List listWordModel;

  ListWordIndoSuccess(this.listWordModel);

  @override
  // TODO: implement props
  List<Object> get props => [listWordModel];
}

class ListWordBugisSuccess extends ListWordState {
  final List listWordModel;

  ListWordBugisSuccess(this.listWordModel);

  @override
  // TODO: implement props
  List<Object> get props => [listWordModel];
}

class ListWordFailed extends ListWordState {
  final String error;

  ListWordFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

class SetWordLoading extends ListWordState {}

class SetWordSuccess extends ListWordState {
  final String message;

  SetWordSuccess(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class SetWordFailed extends ListWordState {
  final String error;

  SetWordFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
