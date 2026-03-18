import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';

class OnboardingController extends StateNotifier<void> {
  final Ref ref;
  OnboardingController(this.ref) : super(null);

  void goToLogin(BuildContext context) {
    context.go('/login');
  }
}

final onboardingControllerProvider =
StateNotifierProvider<OnboardingController, void>((ref) {
  return OnboardingController(ref);
});