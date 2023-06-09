import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:trip_planner/features/trip/controller/trips_list_controller.dart';

class AddTripBottomSheet extends HookConsumerWidget {
  AddTripBottomSheet({super.key});

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripNameController = useTextEditingController();
    final destinationController = useTextEditingController();
    final startDateController = useTextEditingController();
    final endDateController = useTextEditingController();

    return Form(
      key: formGlobalKey,
      child: Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 15,
        ),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: tripNameController,
              keyboardType: TextInputType.name,
              validator: (value) {
                const validationError = 'Enter a valid trip name';
                if (value == null || value.isEmpty) {
                  return validationError;
                }
                return null;
              },
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(hintText: 'Trip Name'),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: destinationController,
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                }
                return 'Enter a valid destination';
              },
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(hintText: 'Trip Destination'),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              controller: startDateController,
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                }
                return 'Enter a valid date';
              },
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(hintText: 'Start Date'),
              textInputAction: TextInputAction.next,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  startDateController.text = formattedDate;
                } else {}
              },
            ),
            TextFormField(
              controller: endDateController,
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                }
                return 'Enter a valid date';
              },
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(hintText: 'End Date'),
              textInputAction: TextInputAction.next,
              onTap: () async {
                if (startDateController.text.isNotEmpty) {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.parse(startDateController.text),
                      firstDate: DateTime.parse(startDateController.text),
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    endDateController.text = formattedDate;
                  }
                }
              },
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                final currentState = formGlobalKey.currentState;
                if (currentState == null) {
                  return;
                }
                if (currentState.validate()) {
                  ref.read(tripsListControllerProvider).add(
                        name: tripNameController.text,
                        destination: destinationController.text,
                        startDate: startDateController.text,
                        endDate: endDateController.text,
                      );
                  Navigator.of(context).pop();
                }
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
