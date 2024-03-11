import 'package:blinderville/views/dashboard/dashboard.dart';
import 'package:blinderville/views/dashboard/home.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: '/dashboard', routes: [
  GoRoute(
    path: '/dashboard',
    name: 'dashboard',
    builder: (context, state) => const Dashboard(),
  ),
  GoRoute(
    path: '/home',
    name: 'home',
    builder: (context, state) => const Home(),
  ),
]);
