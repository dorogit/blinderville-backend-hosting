import 'package:blinderville/views/dashboard/dashboard.dart';
import 'package:blinderville/views/thread.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: '/dashboard', routes: [
  GoRoute(
    path: '/dashboard',
    name: 'dashboard',
    builder: (context, state) => const Dashboard(),
  ),
  GoRoute(
    path: '/forum/:id',
    name: 'tst',
    builder: (context, state) => const Thread(),
  ),
]);
