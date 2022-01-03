import 'package:cima_client/src/localization/l10n.dart';
import 'package:flutter/material.dart';

class CimaLoading extends StatelessWidget {
  const CimaLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
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
                l10n.searching,
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
