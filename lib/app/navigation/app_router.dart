import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../viewmodel/cost_calculator/form/cost_calculator_form.dart';
import '../widget/page/cost_calculator_page.dart';
import '../widget/page/default_page.dart';
import '../widget/page/profitability_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DefaultRoute.page, initial: true),
        AutoRoute(path: '/calc', page: CostCalculatorRoute.page),
      ];
}
