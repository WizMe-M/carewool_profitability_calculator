import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          Text('Option 1'),
          Text('Option 2'),
          Text('Option 3'),
          Text('Option 4'),
          Text('Option 5'),
        ],
      ),
    );
  }
}
