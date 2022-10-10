part of 'list_word_cubit.dart';

abstract class ListWordState extends Equatable {
  const ListWordState();

  @override
  List<Object> get props => [];
}

class ListWordInitial extends ListWordState {}

class ListWordLoading extends ListWordState {}

class ListWordIndoSuccess extends ListWordState {
  final List<ListWordModel> listWordModel;

  ListWordIndoSuccess(this.listWordModel);

  @override
  // TODO: implement props
  List<Object> get props => [listWordModel];
}

class ListWordBugisSuccess extends ListWordState {
  final List<ListWordModel> listWordModel;

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
