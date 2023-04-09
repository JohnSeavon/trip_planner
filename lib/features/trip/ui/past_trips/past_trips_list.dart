import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_planner/common/ui/the_navigation_drawer.dart';
import 'package:trip_planner/common/utils/colors.dart' as constants;
import 'package:trip_planner/features/trip/data/trips_repository.dart';
import 'package:trip_planner/features/trip/ui/trip_gridview_item/trip_gridview_item.dart';

class PastTripsList extends ConsumerWidget {
  const PastTripsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsListValue = ref.watch(pastTripsListStreamProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Trip Planner'),
        backgroundColor: const Color(constants.primaryColorDark),
      ),
      drawer: const TheNavigationDrawer(),
      body: tripsListValue.when(
        data: (trips) => trips.isEmpty
            ? const Center(
                child: Text('No trips'),
              )
            : OrientationBuilder(builder: (context, orientation) {
                return GridView.count(
                  crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  padding: const EdgeInsets.all(4),
                  childAspectRatio:
                      (orientation == Orientation.portrait) ? 0.9 : 1.4,
                  children: trips.map((tripData) {
                    return TripGridViewItem(
                      trip: tripData!,
                      isPast: true,
                    );
                  }).toList(growable: false),
                );
              }),
        error: (error, stackTrace) => const Center(
          child: Text('Unexpected error'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
