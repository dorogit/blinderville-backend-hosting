import 'package:blinderville/views/dashboard/dashboard.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: 'dashboard',
    builder: (context, state) => Dashboard(),
  ),
]);
