import 'package:firebase_database/firebase_database.dart';

import '../models/usermodel.dart';

class SignUpService {
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  Future<UserModel> signup(UserModel? user) async {
    ref.child("UserTable").push().set(
          user?.toMap(),
        );
    return UserModel();
  }
}
