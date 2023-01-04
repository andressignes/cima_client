import 'dart:developer';

import 'package:cima_client/app/router/routes.dart';
import 'package:cima_client/authorized/authorized.dart';
import 'package:cima_client/home/home.dart';
import 'package:cima_client/medication_detail/medication_detail.dart';
import 'package:cima_client/search/search.dart';
import 'package:cima_client/search_result/search_result.dart';
import 'package:cima_client/settings/settings.dart';
import 'package:cima_client/supply_problems/supply_problems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: Routes.home.path,
  routes: <RouteBase>[
    GoRoute(
      name: Routes.home.name,
      path: Routes.home.path,
      pageBuilder: (context, state) => HomePage.page(key: state.pageKey),
      routes: [
        GoRoute(
          path: 'search',
          pageBuilder: (context, state) => SearchPage.page,
        ),
      ],
    ),
    GoRoute(
      name: Routes.settings.name,
      path: Routes.settings.path,
      pageBuilder: (context, state) => SettingsPage.page,
    ),
    GoRoute(
      name: Routes.supplyProblems.name,
      path: Routes.supplyProblems.path,
      pageBuilder: (context, state) => SupplyProblemsPage.page,
    ),
    GoRoute(
      name: Routes.lastAuthorized.name,
      path: Routes.lastAuthorized.path,
      pageBuilder: (context, state) => LastAuthorizedPage.page,
    ),
    GoRoute(
      name: Routes.search.name,
      path: Routes.search.path,
      pageBuilder: (context, state) => SearchPage.page,
      routes: [
        GoRoute(
          name: Routes.searchResult.name,
          path: Routes.searchResult.path,
          pageBuilder: (context, state) {
            return SearchResultPage.page();
          },
        ),
      ],
    ),
    GoRoute(
      name: Routes.medicationDetail.name,
      path: Routes.medicationDetail.path,
      pageBuilder: (context, state) {
        final stateBloc = context.read<SearchMedicationResultBloc>().state;
        if (stateBloc is AvailableSearchMedicationResultState) {
          final medicamento = stateBloc.medicamentos.firstWhere(
            (element) =>
                element.registerNumber == state.queryParams['nregistro'],
          );
          return MedicationDetailPage.page(medication: medicamento);
        } else {
          log('medication not found');
          return MaterialPage(child: Container());
        }
      },
    )
  ],
);
