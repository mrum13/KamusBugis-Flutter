part of 'list_comparisson_cubit.dart';

abstract class ListComparissonState extends Equatable {
  const ListComparissonState();

  @override
  List<Object> get props => [];
}

class ListComparissonInitial extends ListComparissonState {}

class ListComparissonLoading extends ListComparissonState {}

class ListComparissonSuccess extends ListComparissonState {
  final bool listComparisson;

  ListComparissonSuccess(this.listComparisson);

  @override
  // TODO: implement props
  List<Object> get props => [listComparisson];
}

class ListComparissonFailed extends ListComparissonState {
  final String error;

  ListComparissonFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

class SetComparissonLoading extends ListComparissonState {}

class SetComparissonSuccess extends ListComparissonState {
  final String message;

  SetComparissonSuccess(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class SetComparissonFailed extends ListComparissonState {
  final String error;

  SetComparissonFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
