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
    CostPriceHistoryRoute.name: (routeData) {
      final args = routeData.argsAs<CostPriceHistoryRouteArgs>(
          orElse: () => const CostPriceHistoryRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CostPriceHistoryPage(key: args.key),
      );
    },
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
    ExcelUploadRoute.name: (routeData) {
      final args = routeData.argsAs<ExcelUploadRouteArgs>(
          orElse: () => const ExcelUploadRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExcelUploadPage(key: args.key),
      );
    },
    ImportRoute.name: (routeData) {
      final args = routeData.argsAs<ImportRouteArgs>(
          orElse: () => const ImportRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ImportPage(key: args.key),
      );
    },
    ProfitabilityCalcHistoryRoute.name: (routeData) {
      final args = routeData.argsAs<ProfitabilityCalcHistoryRouteArgs>(
          orElse: () => const ProfitabilityCalcHistoryRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfitabilityCalcHistoryPage(key: args.key),
      );
    },
    ProfitabilityRoute.name: (routeData) {
      final args = routeData.argsAs<ProfitabilityRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfitabilityPage(
          costPrice: args.costPrice,
          lastCommissionUpload: args.lastCommissionUpload,
          lastStorageUpload: args.lastStorageUpload,
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
/// [ImportPage]
class ImportRoute extends PageRouteInfo<ImportRouteArgs> {
  ImportRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ImportRoute.name,
          args: ImportRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ImportRoute';

  static const PageInfo<ImportRouteArgs> page = PageInfo<ImportRouteArgs>(name);
}

class ImportRouteArgs {
  const ImportRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ImportRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ProfitabilityCalcHistoryPage]
class ProfitabilityCalcHistoryRoute
    extends PageRouteInfo<ProfitabilityCalcHistoryRouteArgs> {
  ProfitabilityCalcHistoryRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProfitabilityCalcHistoryRoute.name,
          args: ProfitabilityCalcHistoryRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProfitabilityCalcHistoryRoute';

  static const PageInfo<ProfitabilityCalcHistoryRouteArgs> page =
      PageInfo<ProfitabilityCalcHistoryRouteArgs>(name);
}

class ProfitabilityCalcHistoryRouteArgs {
  const ProfitabilityCalcHistoryRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ProfitabilityCalcHistoryRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ProfitabilityPage]
class ProfitabilityRoute extends PageRouteInfo<ProfitabilityRouteArgs> {
  ProfitabilityRoute({
    required CostPrice costPrice,
    required CommissionUpload lastCommissionUpload,
    required StorageUpload lastStorageUpload,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProfitabilityRoute.name,
          args: ProfitabilityRouteArgs(
            costPrice: costPrice,
            lastCommissionUpload: lastCommissionUpload,
            lastStorageUpload: lastStorageUpload,
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
    required this.lastCommissionUpload,
    required this.lastStorageUpload,
    this.key,
  });

  final CostPrice costPrice;

  final CommissionUpload lastCommissionUpload;

  final StorageUpload lastStorageUpload;

  final Key? key;

  @override
  String toString() {
    return 'ProfitabilityRouteArgs{costPrice: $costPrice, lastCommissionUpload: $lastCommissionUpload, lastStorageUpload: $lastStorageUpload, key: $key}';
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
