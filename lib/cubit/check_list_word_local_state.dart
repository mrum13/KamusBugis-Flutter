part of 'check_list_word_local_cubit.dart';

abstract class CheckListWordLocalState extends Equatable {
  const CheckListWordLocalState();

  @override
  List<Object> get props => [];
}

class CheckListWordLocalInitial extends CheckListWordLocalState {}

class CheckListWordLocalLoading extends CheckListWordLocalState {}

class CheckListWordBugisLocalSuccess extends CheckListWordLocalState {
  final String status;

  CheckListWordBugisLocalSuccess(
    this.status,
  );

  @override
  // TODO: implement props
  List<Object> get props => [status];
}

class CheckListWordIndoLocalSuccess extends CheckListWordLocalState {
  final String status;

  CheckListWordIndoLocalSuccess(
    this.status,
  );

  @override
  // TODO: implement props
  List<Object> get props => [status];
}

class CheckListWordLocalFailed extends CheckListWordLocalState {
  final String error;

  CheckListWordLocalFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
