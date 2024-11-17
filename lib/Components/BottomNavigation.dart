import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Bottomnavigation extends StatefulWidget {
  final int value;
  final Function(int) onTap;

  const Bottomnavigation({super.key, required this.value, required this.onTap});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  @override
  Widget build(BuildContext context) { 
    return CurvedNavigationBar(
      cornerRadius: 30,
      backgroundColor: Colors.transparent,
      color: Colors.grey[800]!,
      buttonBackgroundColor: Colors.grey[900],
      height: 70,
      items: const <Widget>[
        Icon(Icons.air, size: 40, color: Colors.white),
        Icon(Icons.cloud, size: 40, color: Colors.white),
      ],
      animationDuration: const Duration(milliseconds: 200),
      index: widget.value,
      animationCurve: Curves.bounceInOut,
      onTap: (index) {
        widget.onTap(index);
      },
    );
  }
}