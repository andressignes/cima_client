import 'package:cima_client/l10n/l10n.dart';
import 'package:flutter/material.dart';

class CimaLoading extends StatelessWidget {
  const CimaLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('💊', style: TextStyle(fontSize: 32)),
              const SizedBox(width: 16),
              Text(
                l10n.searching,
                style: theme.textTheme.headlineSmall,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
