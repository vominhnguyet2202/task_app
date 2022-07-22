import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final auth.FirebaseAuth _firebaseAuth;

  UserRepository({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<User?> signIn( String email,String password) async {
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        var user = await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future<User?> signUp(String email, String password) async {
    try {
      var auth = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return auth.user;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    return null;
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<bool> isSignIn() async {
    final currentUser = await _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<User?> getUser() async {
    return await _firebaseAuth.currentUser!;
  }
}
