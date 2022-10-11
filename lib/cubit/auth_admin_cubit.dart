import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kamus_bugis/services/auth_service.dart';

part 'auth_admin_state.dart';

class AuthAdminCubit extends Cubit<AuthAdminState> {
  AuthAdminCubit() : super(AuthAdminInitial());

  void signIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthAdminLoading());
      String message =
          await AuthService().signIn(email: email, password: password);
      emit(AuthAdminSuccess(message));
    } catch (e) {
      emit(AuthAdminFailed(e.toString()));
    }
  }
}
