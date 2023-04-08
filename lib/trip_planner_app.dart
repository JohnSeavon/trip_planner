import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_planner/common/navigation/router/routes.dart';
import 'package:trip_planner/common/utils/colors.dart' as constants;
import 'package:trip_planner/features/trip/ui/trip_list/trips_list_page.dart';
import 'package:trip_planner/features/trip/ui/trip_page/trip_page.dart';

class TripPlannerApp extends StatelessWidget {
  const TripPlannerApp({
    required this.isAmplifySuccessfullyConfigured,
    super.key,
  });

  final bool isAmplifySuccessfullyConfigured;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: AppRoute.home.name,
          builder: (context, state) => isAmplifySuccessfullyConfigured
              ? const TripsListPage()
              : const Scaffold(
                  body: Center(
                    child: Text(
                      'Tried to reconfigure Amplify'
                      'This can occur when your app restarts on Android.',
                    ),
                  ),
                ),
        ),
        GoRoute(
          path: '/trip/:id',
          name: AppRoute.trip.name,
          builder: (context, state) {
            final tripId = state.params['id']!;
            return TripPage(tripId: tripId);
          },
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    );

    return Authenticator(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
        builder: Authenticator.builder(),
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: constants.primaryColor)
                  .copyWith(
            background: const Color(0xFF82CFEA),
          ),
        ),
      ),
    );
  }
}
