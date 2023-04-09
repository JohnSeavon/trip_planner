import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_planner/common/navigation/router/routes.dart';
import 'package:trip_planner/common/utils/colors.dart' as constants;
import 'package:trip_planner/features/trip/ui/trip_gridview_item/trip_gridview_item_card.dart';
import 'package:trip_planner/models/ModelProvider.dart';

class TripGridViewItem extends StatelessWidget {
  const TripGridViewItem({
    super.key,
    required this.trip,
    required this.isPast,
  });

  final Trip trip;
  final bool isPast;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: constants.primarySwatch[900],
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        context.goNamed(
          isPast ? AppRoute.pasttrip.name : AppRoute.trip.name,
          params: {'id': trip.id},
        );
      },
      child: isPast
          ? ColorFiltered(
              colorFilter: const ColorFilter.matrix(constants.greyoutMatrix),
              child: TripGridViewItemCard(
                trip: trip,
              ),
            )
          : TripGridViewItemCard(
              trip: trip,
            ),
    );
  }
}
