import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up with email and password
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // User signed up successfully
    } catch (e) {
      // Handle sign up errors
      print('Error signing up: $e');
      throw e; // Rethrow the error for handling in UI
    }
  }

  // Sign in with email and password
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // User signed in successfully
    } catch (e) {
      // Handle sign in errors
      print('Error signing in: $e');
      throw e; // Rethrow the error for handling in UI
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      // User signed out successfully
    } catch (e) {
      // Handle sign out errors
      print('Error signing out: $e');
      throw e; // Rethrow the error for handling in UI
    }
  }
}
