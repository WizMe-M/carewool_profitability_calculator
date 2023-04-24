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
    CalculatorRoute.name: (routeData) {
      final args = routeData.argsAs<CalculatorRouteArgs>(
          orElse: () => const CalculatorRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CalculatorPage(key: args.key),
      );
    },
    LoadingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoadingScreen(),
      );
    },
  };
}

/// generated route for
/// [CalculatorPage]
class CalculatorRoute extends PageRouteInfo<CalculatorRouteArgs> {
  CalculatorRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CalculatorRoute.name,
          args: CalculatorRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CalculatorRoute';

  static const PageInfo<CalculatorRouteArgs> page =
      PageInfo<CalculatorRouteArgs>(name);
}

class CalculatorRouteArgs {
  const CalculatorRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CalculatorRouteArgs{key: $key}';
  }
}

/// generated route for
/// [LoadingScreen]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute({List<PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
