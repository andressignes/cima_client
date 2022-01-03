import 'package:flutter/material.dart';

class CimaLoading extends StatelessWidget {
  const CimaLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('💊', style: TextStyle(fontSize: 32)),
              const SizedBox(width: 16),
              Text(
                'Loading...',
                style: theme.textTheme.headline5,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
