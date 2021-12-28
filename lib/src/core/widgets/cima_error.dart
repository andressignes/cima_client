import 'package:flutter/material.dart';

class CimaError extends StatelessWidget {
  const CimaError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('🙈', style: TextStyle(fontSize: 64)),
          Text(
            'Something went wrong!',
            style: theme.textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
