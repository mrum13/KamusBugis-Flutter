part of 'check_sentence_local_cubit.dart';

abstract class CheckSentenceLocalState extends Equatable {
  const CheckSentenceLocalState();

  @override
  List<Object> get props => [];
}

class CheckSentenceLocalInitial extends CheckSentenceLocalState {}

class CheckSentenceLocalLoading extends CheckSentenceLocalState {}

class CheckSentenceLocalSuccess extends CheckSentenceLocalState {
  final String status;

  CheckSentenceLocalSuccess(
    this.status,
  );

  @override
  // TODO: implement props
  List<Object> get props => [status];
}

class CheckSentenceLocalFailed extends CheckSentenceLocalState {
  final String error;

  CheckSentenceLocalFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
