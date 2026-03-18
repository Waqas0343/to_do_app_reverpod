import 'package:go_router/go_router.dart';
import 'package:to_do_app_reverpod/routes/routes.dart';
import '../features/todo/presentation/screens/onboarding_screen.dart';
import '../features/todo/presentation/screens/splash_screen.dart';
import '../features/todo/presentation/screens/login_screen.dart';
import '../features/todo/presentation/screens/signup_screen.dart';
import '../features/todo/presentation/screens/home_screen.dart';
import '../features/todo/presentation/screens/add_edit_todo_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation:  AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) =>  SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.introScreen,
      builder: (context, state) =>  OnboardingScreen(),
    ),

    GoRoute(
      path: AppRoutes.loginAuthScreen,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.signupScreen,
      builder: (context, state) => SignupScreen(),
    ),
    GoRoute(
      path:AppRoutes.homeScreen,
      builder: (context, state) =>  HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.addNotesScreen,
      builder: (context, state) => AddEditTodoScreen(),
    ),
  ],
);