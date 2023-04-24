import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';

import 'calculator_page.dart';
import '../loading_screen.dart';

@RoutePage()
class DefaultPage extends StatelessWidget {
  const DefaultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetIt.I.allReady(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          FlutterNativeSplash.remove();
          return CalculatorPage();
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}
