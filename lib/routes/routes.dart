import 'package:blinderville/views/dashboard/dashboard.dart';
import 'package:blinderville/views/dashboard/home.dart';
import 'package:go_router/go_router.dart';

final mainRoutes = [
  GoRoute(path: '/dashboard', builder: (context, state) => Dashboard())
];
