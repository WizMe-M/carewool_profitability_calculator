import 'package:carewool_profitability_calculator/viewmodel/repo/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SideBar extends StatelessWidget {
  SideBar({super.key});

  final ProductRepoStore _repo = GetIt.I.get<ProductRepoStore>();

  @override
  Widget build(BuildContext context) {
    var list = _repo.products.toList(growable: false);
    return Drawer(
      child: SafeArea(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(list[index].name),
          ),
        ),
      ),
    );
  }
}
