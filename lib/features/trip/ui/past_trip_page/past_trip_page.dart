import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_planner/common/navigation/router/routes.dart';
import 'package:trip_planner/common/ui/the_navigation_drawer.dart';
import 'package:trip_planner/common/utils/colors.dart' as constants;
import 'package:trip_planner/features/trip/data/trips_repository.dart';
import 'package:trip_planner/features/trip/ui/past_trip_page/selected_past_trip_card.dart';

class PastTripPage extends ConsumerWidget {
  const PastTripPage({
    required this.tripId,
    super.key,
  });

  final String tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripValue = ref.watch(tripProvider(tripId));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Trip Planner'),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed(AppRoute.home.name);
            },
            icon: const Icon(Icons.home),
          ),
        ],
        backgroundColor: const Color(constants.primaryColorDark),
      ),
      drawer: const TheNavigationDrawer(),
      body: ColorFiltered(
        colorFilter: const ColorFilter.matrix(constants.greyoutMatrix),
        child: tripValue.when(
          data: (trip) => trip == null
              ? const Center(
                  child: Text('Trip not found'),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    SelectedPastTripCard(trip: trip),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      height: 20,
                      thickness: 5,
                      indent: 20,
                      endIndent: 20,
                    ),
                    const Text(
                      'Your Activities',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
          error: (error, stackTrace) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        ),
      ),
    );
  }
}
