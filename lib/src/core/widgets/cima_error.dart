import 'package:cima_client/src/localization/l10n.dart';
import 'package:flutter/material.dart';

class CimaError extends StatelessWidget {
  const CimaError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('🙈', style: TextStyle(fontSize: 64)),
          Text(
            l10n.error_title,
            style: theme.textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
