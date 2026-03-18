import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app_reverpod/routes/routes.dart';

class OnboardingController extends StateNotifier<void> {
  final Ref ref;
  OnboardingController(this.ref) : super(null);

  void goToLogin(BuildContext context) {
    context.go(AppRoutes.loginAuthScreen);
  }
}

final onboardingControllerProvider =
StateNotifierProvider<OnboardingController, void>((ref) {
  return OnboardingController(ref);
});