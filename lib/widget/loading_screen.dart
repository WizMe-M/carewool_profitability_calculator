import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}

