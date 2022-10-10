part of 'list_comparisson_cubit.dart';

abstract class ListComparissonState extends Equatable {
  const ListComparissonState();

  @override
  List<Object> get props => [];
}

class ListComparissonInitial extends ListComparissonState {}

class ListComparissonLoading extends ListComparissonState {}

class ListComparissonSuccess extends ListComparissonState {
  final List<ListComparissonModel> listComparisson;

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
