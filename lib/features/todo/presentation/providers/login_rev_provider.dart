import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import '../../../../main.dart';

class LoginController extends StateNotifier<void> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Ref ref;
  LoginController(this.ref) : super(null);
  Future<void> login(BuildContext context, String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email & Password cannot be empty")),
      );
      return;
    }
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setBool('logged_in', true);
    if (context.mounted) {
      context.go('/home');
    }
  }

  void goToSignUp(BuildContext context) {
    context.go('/signup');
  }
}

final loginControllerProvider =
StateNotifierProvider<LoginController, void>((ref) {
  return LoginController(ref);
});