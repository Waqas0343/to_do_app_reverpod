import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import '../../../../main.dart';

class SplashController extends StateNotifier<void> {
  final Ref ref;
  SplashController(this.ref) : super(null);

  Future<String> _getNextRoute() async {
    final prefs = ref.read(sharedPreferencesProvider);
    final firstTime = prefs.getBool('first_time') ?? true;
    final loggedIn = prefs.getBool('logged_in') ?? false;

    if (firstTime) {
      await prefs.setBool('first_time', false);
      return '/intro';
    } else if (loggedIn) {
      return '/home';
    } else {
      return '/login';
    }
  }
  Future<void> navigate(BuildContext context) async {
    final nextRoute = await _getNextRoute();
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      context.go(nextRoute);
    }
  }
}

final splashControllerProvider =
StateNotifierProvider<SplashController, void>((ref) {
  return SplashController(ref);
});