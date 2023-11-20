import 'package:bloc/bloc.dart';
import 'package:get/get.dart' as GetX;
import 'package:meta/meta.dart';
import 'package:music_app/models/usermodel.dart';
import 'package:music_app/screen/login/login_screen.dart';
import 'package:music_app/service/signup_service.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  String email = "";
  String phone = "";
  String name = "";
  String lastname = "";
  String password = "";
  SignupBloc() : super(SignupInitial()) {
    on<SignUpDataEvent>((event, emit) async => _signUp(event, emit));
    on<SetText>((event, emit) async => _setText(event, emit));
  }

  _signUp(SignUpDataEvent event, Emitter<SignupState> emit) async {
    // if (await event.validateEmail()) event.signUp();
    bool emailvalidate = await event.validateEmail(email);
    bool phonevalidate = await event.validatePhone(phone);
    bool namevalidate = await event.validateTextName(name);
    bool lastnamevalidate = await event.validateTextName(lastname);
    bool passwordvalidate = await event.validatePassword(password);
    //
    if (emailvalidate && phonevalidate && namevalidate && lastnamevalidate && passwordvalidate) {
      event.signUp();
      GetX.Get.to(
        () => LoginScreen(),
        transition: GetX.Transition.fadeIn,
      );
    } else {
      GetX.Get.back();
      emit(SignupFail(message: "ข้อมูลไม่ครบ"));
    }
  }

  _setText(SetText event, Emitter<SignupState> emit) async {
    if (event.type == "email") {
      email = await event.setText();
    } else if (event.type == "phone") {
      phone = await event.setText();
    } else if (event.type == "name") {
      name = await event.setText();
    } else if (event.type == "lastname") {
      lastname = await event.setText();
    } else if (event.type == "password") {
      password = await event.setText();
    }
  }
}
