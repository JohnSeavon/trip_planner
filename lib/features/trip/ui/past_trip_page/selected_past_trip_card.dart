import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_planner/common/utils/colors.dart' as constants;
import 'package:trip_planner/models/ModelProvider.dart';

class SelectedPastTripCard extends ConsumerWidget {
  const SelectedPastTripCard({
    required this.trip,
    super.key,
  });

  final Trip trip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            trip.tripName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            alignment: Alignment.center,
            color: const Color(constants.primaryColorDark),
            height: 150,
            child: trip.tripImageUrl != null
                ? Stack(
                    children: [
                      const Center(child: CircularProgressIndicator.adaptive()),
                      CachedNetworkImage(
                        cacheKey: trip.tripImageKey,
                        imageUrl: trip.tripImageUrl!,
                        width: double.maxFinite,
                        height: 500,
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      )
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(50),
                    child: Image.asset(
                      'assets/images/departure-v.png',
                      fit: BoxFit.contain,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
