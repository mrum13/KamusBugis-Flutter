part of 'check_compare_word_local_cubit.dart';

abstract class CheckCompareWordLocalState extends Equatable {
  const CheckCompareWordLocalState();

  @override
  List<Object> get props => [];
}

class CheckCompareWordLocalInitial extends CheckCompareWordLocalState {}

class CheckCompareWordLocalLoading extends CheckCompareWordLocalState {}

class CheckCompareWordLocalSuccess extends CheckCompareWordLocalState {
  final String status;

  CheckCompareWordLocalSuccess(
    this.status,
  );

  @override
  // TODO: implement props
  List<Object> get props => [status];
}

class CheckCompareWordLocalFailed extends CheckCompareWordLocalState {
  final String error;

  CheckCompareWordLocalFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
