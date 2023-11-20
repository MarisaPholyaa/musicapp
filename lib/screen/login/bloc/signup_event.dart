// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignUpDataEvent extends SignupEvent {
  UserModel? user;

  SignUpDataEvent({
    this.user,
  });

  final SignUpService service = SignUpService();

  Future<UserModel> signUp() async => service.signup(user);

  Future<bool> validateEmail(String? email) async {
    var emailValidate = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email ?? "");
    return emailValidate;
  }

  Future<bool> validatePhone(String? phone) async {
    var phoneValidate = RegExp(r'[0-9]').hasMatch(phone ?? "");
    return phoneValidate;
  }

  Future<bool> validateTextName(String? text) async {
    var textValidate = RegExp(r'[a-zA-Zก-ฮ]').hasMatch(text ?? "");
    return textValidate;
  }

  Future<bool> validatePassword(String? password) async {
    var passwordValidate = RegExp(r'[a-zA-Z0-9]').hasMatch(password ?? "");
    return passwordValidate;
  }
  //
}

class SetText extends SignupEvent {
  String? text;
  String? type;
  SetText({
    this.text,
    this.type,
  });

  Future<String> setText() async {
    if ((text?.isNotEmpty ?? false)) {
      return text ?? '';
    } else {
      return '';
    }
  }
}
