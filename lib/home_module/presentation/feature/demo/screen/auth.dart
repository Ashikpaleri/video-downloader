import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User ? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void>SignInWithPhone({required String phone, })async{
    await _firebaseAuth.signInWithPhoneNumber(phone);
  }

  // Future<void>CreateWithPhone({required String phone, })async{
  //   await _firebaseAuth.cr;
  // }

Future<void>signOut()async{
    await _firebaseAuth.signOut();
}
}