import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trip_planner/common/utils/colors.dart' as constants;
import 'package:trip_planner/models/ModelProvider.dart';

class TripGridViewItemCard extends StatelessWidget {
  const TripGridViewItemCard({
    super.key,
    required this.trip,
  });

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: 500,
              alignment: Alignment.center,
              color: const Color(constants.primaryColorDark),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: trip.tripImageUrl != null
                        ? Stack(
                            children: [
                              const Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                              CachedNetworkImage(
                                errorWidget: (context, url, dynamic error) {
                                  return const Icon(
                                      Icons.error_outline_outlined);
                                },
                                imageUrl: trip.tripImageUrl!,
                                cacheKey: trip.tripImageKey,
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
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    // child: FittedBox(
                    //   fit: BoxFit.scaleDown,
                    //   alignment: Alignment.centerLeft,
                    child: Text(
                      trip.destination,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    //),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: DefaultTextStyle(
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleMedium!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      trip.tripName,
                      style: theme.textTheme.titleMedium!.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Text(
                    DateFormat('MMMM dd, yyyy')
                        .format(trip.startDate.getDateTime()),
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    DateFormat('MMMM dd, yyyy')
                        .format(trip.endDate.getDateTime()),
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
