import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetIt.I.allReady(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
            context.router.replaceNamed('/'); // TODO: not working
        }
        return const Scaffold(
          body: SafeArea(
            child: Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
    );
  }
}
