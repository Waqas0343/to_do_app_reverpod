import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class SignUpRevProvider extends StateNotifier<void> {
  final Ref ref;
  SignUpRevProvider(this.ref) : super(null);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}

final signUpControllerProvider =
StateNotifierProvider<SignUpRevProvider, void>((ref) {
  return SignUpRevProvider(ref);
});