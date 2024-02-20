import 'package:alva_app/authentication/auth_service.dart';
import 'package:flutter/material.dart';


class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  await _authService.signUpWithEmailAndPassword(
                    _emailController.text,
                    _passwordController.text,
                  );
                  // Navigate to the next screen upon successful sign-up
                  Navigator.pushReplacementNamed(context, '/home');
                } catch (e) {
                  // Handle sign-up errors (e.g., display error message to user)
                  print('Sign-up error: $e');
                }
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
