import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  static doLogout() async {
    await FirebaseAuth.instance.signOut();
  }
}
