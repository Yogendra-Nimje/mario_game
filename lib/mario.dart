import 'package:flutter/material.dart';

class MyMario extends StatelessWidget {
  const MyMario({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Image.asset('assets/mario.jpg'),
    );
  }
}
