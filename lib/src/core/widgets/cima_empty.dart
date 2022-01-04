import 'package:flutter/material.dart';

class CimaEmpty extends StatelessWidget {
  const CimaEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '⚕️',
        style: TextStyle(fontSize: 64),
      ),
    );
  }
}
