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
  SignupBloc() : super(SignupInitial()) {
    on<SignUpDataEvent>((event, emit) async => _signUp(event, emit));
    on<SetText>((event, emit) async => _setText(event, emit));
  }

  _signUp(SignUpDataEvent event, Emitter<SignupState> emit) async {
    // if (await event.validateEmail()) event.signUp();
    bool validate = await event.validateEmail(email);
    if (validate) {
      event.signUp();
      GetX.Get.to(
        () => LoginScreen(),
        transition: GetX.Transition.fadeIn,
      );
    } else {
      GetX.Get.back();
      emit(SignupFail(message: "รูปแบบ email ไม่ถูกต้อง"));
    }
  }

  _setText(SetText event, Emitter<SignupState> emit) async {
    email = await event.setText();
  }
}
