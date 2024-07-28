import 'package:ringo_media/file_export.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  bool passwordSecure = true;
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  void updatePasswordIcon() {
    passwordSecure = !passwordSecure;
    emit(LoginUpdatePasswordIcon());
  }

  bool loginButtonDisabled() {
    bool buttonDisable = userName.text.isEmpty || password.text.isEmpty;
    emit(LoginInitial());
    return buttonDisable;
  }
}
