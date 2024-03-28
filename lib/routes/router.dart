import 'package:blinderville/views/dashboard/dashboard.dart';
import 'package:blinderville/views/sign_up.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: '/dashboard', routes: [
  GoRoute(
    path: '/dashboard',
    name: 'dashboard',
    builder: (context, state) => const Dashboard(),
  ),
  GoRoute(
    path: '/signup',
    name: 'signup',
    builder: (context, state) => const SignUp(),
  ),
]);
