import 'package:blinderville/views/dashboard/dashboard.dart';
import 'package:blinderville/views/dashboard/home.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: '/home', routes: [
  GoRoute(
    path: '/dashboard',
    name: 'dashboard',
    builder: (context, state) => Dashboard(),
  ),
  GoRoute(
    path: '/home',
    name: 'home',
    builder: (context, state) => const Home(),
  ),
]);
