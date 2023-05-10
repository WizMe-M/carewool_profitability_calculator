// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CostCalculatorRoute.name: (routeData) {
      final args = routeData.argsAs<CostCalculatorRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CostCalculatorPage(
          form: args.form,
          key: args.key,
        ),
      );
    },
    DefaultRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DefaultPage(),
      );
    },
    EditCostPriceRoute.name: (routeData) {
      final args = routeData.argsAs<EditCostPriceRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditCostPricePage(
          editWrap: args.editWrap,
          key: args.key,
        ),
      );
    },
    CostPriceHistoryRoute.name: (routeData) {
      final args = routeData.argsAs<CostPriceHistoryRouteArgs>(
          orElse: () => const CostPriceHistoryRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CostPriceHistoryPage(key: args.key),
      );
    },
    LogisticRoute.name: (routeData) {
      final args = routeData.argsAs<LogisticRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LogisticPage(
          costPrice: args.costPrice,
          key: args.key,
        ),
      );
    },
    ExcelUploadRoute.name: (routeData) {
      final args = routeData.argsAs<ExcelUploadRouteArgs>(
          orElse: () => const ExcelUploadRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExcelUploadPage(key: args.key),
      );
    },
    ProfitabilityRoute.name: (routeData) {
      final args = routeData.argsAs<ProfitabilityRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfitabilityPage(
          costPrice: args.costPrice,
          lastUpload: args.lastUpload,
          key: args.key,
        ),
      );
    },
    StartNewProfitabilityRoute.name: (routeData) {
      final args = routeData.argsAs<StartNewProfitabilityRouteArgs>(
          orElse: () => const StartNewProfitabilityRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StartNewProfitabilityPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [CostCalculatorPage]
class CostCalculatorRoute extends PageRouteInfo<CostCalculatorRouteArgs> {
  CostCalculatorRoute({
    required CostPriceForm form,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CostCalculatorRoute.name,
          args: CostCalculatorRouteArgs(
            form: form,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CostCalculatorRoute';

  static const PageInfo<CostCalculatorRouteArgs> page =
      PageInfo<CostCalculatorRouteArgs>(name);
}

class CostCalculatorRouteArgs {
  const CostCalculatorRouteArgs({
    required this.form,
    this.key,
  });

  final CostPriceForm form;

  final Key? key;

  @override
  String toString() {
    return 'CostCalculatorRouteArgs{form: $form, key: $key}';
  }
}

/// generated route for
/// [DefaultPage]
class DefaultRoute extends PageRouteInfo<void> {
  const DefaultRoute({List<PageRouteInfo>? children})
      : super(
          DefaultRoute.name,
          initialChildren: children,
        );

  static const String name = 'DefaultRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditCostPricePage]
class EditCostPriceRoute extends PageRouteInfo<EditCostPriceRouteArgs> {
  EditCostPriceRoute({
    required EditWrap editWrap,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditCostPriceRoute.name,
          args: EditCostPriceRouteArgs(
            editWrap: editWrap,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditCostPriceRoute';

  static const PageInfo<EditCostPriceRouteArgs> page =
      PageInfo<EditCostPriceRouteArgs>(name);
}

class EditCostPriceRouteArgs {
  const EditCostPriceRouteArgs({
    required this.editWrap,
    this.key,
  });

  final EditWrap editWrap;

  final Key? key;

  @override
  String toString() {
    return 'EditCostPriceRouteArgs{editWrap: $editWrap, key: $key}';
  }
}

/// generated route for
/// [CostPriceHistoryPage]
class CostPriceHistoryRoute extends PageRouteInfo<CostPriceHistoryRouteArgs> {
  CostPriceHistoryRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CostPriceHistoryRoute.name,
          args: CostPriceHistoryRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CostPriceHistoryRoute';

  static const PageInfo<CostPriceHistoryRouteArgs> page =
      PageInfo<CostPriceHistoryRouteArgs>(name);
}

class CostPriceHistoryRouteArgs {
  const CostPriceHistoryRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CostPriceHistoryRouteArgs{key: $key}';
  }
}

/// generated route for
/// [LogisticPage]
class LogisticRoute extends PageRouteInfo<LogisticRouteArgs> {
  LogisticRoute({
    required CostPrice costPrice,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LogisticRoute.name,
          args: LogisticRouteArgs(
            costPrice: costPrice,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'LogisticRoute';

  static const PageInfo<LogisticRouteArgs> page =
      PageInfo<LogisticRouteArgs>(name);
}

class LogisticRouteArgs {
  const LogisticRouteArgs({
    required this.costPrice,
    this.key,
  });

  final CostPrice costPrice;

  final Key? key;

  @override
  String toString() {
    return 'LogisticRouteArgs{costPrice: $costPrice, key: $key}';
  }
}

/// generated route for
/// [ExcelUploadPage]
class ExcelUploadRoute extends PageRouteInfo<ExcelUploadRouteArgs> {
  ExcelUploadRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ExcelUploadRoute.name,
          args: ExcelUploadRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ExcelUploadRoute';

  static const PageInfo<ExcelUploadRouteArgs> page =
      PageInfo<ExcelUploadRouteArgs>(name);
}

class ExcelUploadRouteArgs {
  const ExcelUploadRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ExcelUploadRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ProfitabilityPage]
class ProfitabilityRoute extends PageRouteInfo<ProfitabilityRouteArgs> {
  ProfitabilityRoute({
    required CostPrice costPrice,
    required Upload lastUpload,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProfitabilityRoute.name,
          args: ProfitabilityRouteArgs(
            costPrice: costPrice,
            lastUpload: lastUpload,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfitabilityRoute';

  static const PageInfo<ProfitabilityRouteArgs> page =
      PageInfo<ProfitabilityRouteArgs>(name);
}

class ProfitabilityRouteArgs {
  const ProfitabilityRouteArgs({
    required this.costPrice,
    required this.lastUpload,
    this.key,
  });

  final CostPrice costPrice;

  final Upload lastUpload;

  final Key? key;

  @override
  String toString() {
    return 'ProfitabilityRouteArgs{costPrice: $costPrice, lastUpload: $lastUpload, key: $key}';
  }
}

/// generated route for
/// [StartNewProfitabilityPage]
class StartNewProfitabilityRoute
    extends PageRouteInfo<StartNewProfitabilityRouteArgs> {
  StartNewProfitabilityRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          StartNewProfitabilityRoute.name,
          args: StartNewProfitabilityRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'StartNewProfitabilityRoute';

  static const PageInfo<StartNewProfitabilityRouteArgs> page =
      PageInfo<StartNewProfitabilityRouteArgs>(name);
}

class StartNewProfitabilityRouteArgs {
  const StartNewProfitabilityRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'StartNewProfitabilityRouteArgs{key: $key}';
  }
}
