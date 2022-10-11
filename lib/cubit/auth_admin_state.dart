part of 'auth_admin_cubit.dart';

abstract class AuthAdminState extends Equatable {
  const AuthAdminState();

  @override
  List<Object> get props => [];
}

class AuthAdminInitial extends AuthAdminState {}

class AuthAdminLoading extends AuthAdminState {}

class AuthAdminSuccess extends AuthAdminState {
  final String message;

  AuthAdminSuccess(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class AuthAdminFailed extends AuthAdminState {
  final String error;

  AuthAdminFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
