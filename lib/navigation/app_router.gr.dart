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
      final args = routeData.argsAs<CalculatorRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CalculatorPage(
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
  };
}

/// generated route for
/// [CalculatorPage]
class CalculatorRoute extends PageRouteInfo<CalculatorRouteArgs> {
  CalculatorRoute({
    required CalculatorForm form,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CalculatorRoute.name,
          args: CalculatorRouteArgs(
            form: form,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CalculatorRoute';

  static const PageInfo<CalculatorRouteArgs> page =
      PageInfo<CalculatorRouteArgs>(name);
}

class CalculatorRouteArgs {
  const CalculatorRouteArgs({
    required this.form,
    this.key,
  });

  final CalculatorForm form;

  final Key? key;

  @override
  String toString() {
    return 'CalculatorRouteArgs{form: $form, key: $key}';
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
