import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_planner/common/utils/colors.dart' as contants;
import 'package:trip_planner/features/trip/data/trips_repository.dart';
import 'package:trip_planner/features/trip/ui/trip_list/add_trip_bottomsheet.dart';
import 'package:trip_planner/features/trip/ui/trip_list/trip_card.dart';

class TripsListPage extends ConsumerWidget {
  const TripsListPage({super.key});

  Future<void> showAddTripDialog(BuildContext context) =>
      showModalBottomSheet<void>(
        isScrollControlled: true,
        elevation: 5,
        context: context,
        builder: (sheetContext) {
          return AddTripBottomSheet();
        },
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsListValue = ref.watch(tripsListStreamProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Trip Planner',
        ),
        backgroundColor: const Color(contants.primaryColorDark),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTripDialog(context);
        },
        backgroundColor: const Color(contants.primaryColorDark),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
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
                    return TripCard(trip: tripData!);
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
