import 'package:cima_client/app/app.dart';
import 'package:cima_client/bootstrap.dart';

void main() => bootstrap(
      (repository, preferences) =>
          App(cimaRepository: repository, preferences: preferences),
    );
