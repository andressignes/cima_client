import 'package:flutter/material.dart';

class CimaEmpty extends StatelessWidget {
  const CimaEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('⚕️', style: TextStyle(fontSize: 64)),
        Text(
          'Please Select a medication!',
          style: theme.textTheme.headline5,
        ),
      ],
    );
  }
}
