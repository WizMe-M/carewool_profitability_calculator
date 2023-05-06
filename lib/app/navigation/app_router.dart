import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../database/entity/cost_price.dart';
import '../../domain/cost_price/form/edit/edit_wrap.dart';
import '../../domain/cost_price/form/cost_price_form.dart';
import '../widget/page/cost_price_history_page.dart';
import '../widget/page/cost_price_page.dart';
import '../widget/page/default_page.dart';
import '../widget/page/edit_cost_price_page.dart';
import '../widget/page/profitability_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DefaultRoute.page, initial: true),
        AutoRoute(page: CostCalculatorRoute.page),
        AutoRoute(page: EditCostPriceRoute.page),
        AutoRoute(page: ProfitabilityRoute.page),
        AutoRoute(page: CostPriceHistoryRoute.page),
      ];
}
