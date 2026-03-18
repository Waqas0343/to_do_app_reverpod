import 'package:go_router/go_router.dart';
import '../features/todo/presentation/screens/onboarding_screen.dart';
import '../features/todo/presentation/screens/splash_screen.dart';
import '../features/todo/presentation/screens/login_screen.dart';
import '../features/todo/presentation/screens/signup_screen.dart';
import '../features/todo/presentation/screens/home_screen.dart';
import '../features/todo/presentation/screens/add_edit_todo_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>  SplashScreen(),
    ),
    GoRoute(
      path: '/intro',
      builder: (context, state) =>  OnboardingScreen(),
    ),

    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignupScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) =>  HomeScreen(),
    ),
    GoRoute(
      path: '/add',
      builder: (context, state) => AddEditTodoScreen(),
    ),
  ],
);