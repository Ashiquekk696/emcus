import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(_handleFirebaseError(e));
    } catch (_) {
      throw Exception("Something went wrong. Please try again.");
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
       User? user = _auth.currentUser;
      if (user != null) {
        print('User signed up successfully: ${user.email}');
        print('User UID: ${user.uid}');
        print('User Display Name: ${user.displayName}');
        print('User Email Verified: ${user.emailVerified}');
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(_handleFirebaseError(e));
    } catch (_) {
      throw Exception("Something went wrong. Please try again.");
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (_) {
      throw Exception("Logout failed. Please try again.");
    }
  }

  String _handleFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided.';
      case 'email-already-in-use':
        return 'This email is already in use.';
      case 'operation-not-allowed':
        return 'Operation not allowed. Please contact support.';
      case 'weak-password':
        return 'The password is too weak.';
      default:
        return 'Authentication error: ${e.message ?? "Unknown error"}';
    }
  }
}
