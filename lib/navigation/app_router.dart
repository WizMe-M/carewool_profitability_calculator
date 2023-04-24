import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widget/page/calculator_page.dart';
import '../widget/page/loading_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoadingRoute.page, initial: true),
        RedirectRoute(path: '/', redirectTo: '/calc'),
        AutoRoute(path: '/calc', page: CalculatorRoute.page),
      ];
}
