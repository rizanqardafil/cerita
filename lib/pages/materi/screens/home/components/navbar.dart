import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: size.width * 0.85,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
