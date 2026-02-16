import 'package:flutter/material.dart';
import 'package:blabla/ui/widgets/actions/bla_button.dart';
import 'package:blabla/ui/widgets/display/bla_divider.dart';

import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../utils/date_time_utils.dart';
import '../../../theme/theme.dart';
import 'ride_prefs_input.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;
  final void Function(RidePref)? onSubmit;
  const RidePrefForm({super.key, this.initRidePref, this.onSubmit});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
    if (widget.initRidePref != null) {
      departure = widget.initRidePref!.departure;
      arrival = widget.initRidePref!.arrival;
      departureDate = widget.initRidePref!.departureDate;
      requestedSeats = widget.initRidePref!.requestedSeats;
    } else {
      departure = null;
      arrival = null;
      departureDate = DateTime.now();
      requestedSeats = 1;
    }
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
  void onDeparturePressed() {}

  void onArrivalPressed() {}

  void onSubmit() {
    if (!isValid) return;

    final pref = RidePref(
      departure: departure!,
      arrival: arrival!,
      departureDate: departureDate,
      requestedSeats: requestedSeats,
    );

    widget.onSubmit?.call(pref);
  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------
  bool get isValid =>
      departure != null && arrival != null && requestedSeats > 0;

  String get departureLabel =>
      departure != null ? departure!.name : "Leaving from";

  String get arrivalLabel => arrival != null ? arrival!.name : "Going to";

  bool get showDeparturePlaceholder => departure == null;

  bool get showArrivalPlaceholder => arrival == null;

  String get dateLabel => DateTimeUtils.formatDateTime(departureDate);

  String get seatLabel => requestedSeats.toString();
  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: BlaSpacings.m,
          ),
          child: Column(
            children: [
              RidePrefInput(
                title: departureLabel,
                leftIcon: Icons.location_on,
                isPlaceHolder: showDeparturePlaceholder,
                onPressed: onDeparturePressed,
              ),
              const BlaDivider(),
              RidePrefInput(
                title: arrivalLabel,
                leftIcon: Icons.location_on,
                isPlaceHolder: showArrivalPlaceholder,
                onPressed: onArrivalPressed,
              ),
              const BlaDivider(),
              RidePrefInput(
                title: dateLabel,
                leftIcon: Icons.calendar_month,
                onPressed: () {},
              ),
              const BlaDivider(),
              RidePrefInput(
                title: seatLabel,
                leftIcon: Icons.person_2_outlined,
                onPressed: () {
                  setState(() {
                    requestedSeats++;
                  });
                },
              ),
            ],
          ),
        ),
        BlaButton(
          text: "Search",
          onPressed: isValid ? onSubmit : null,
        ),
      ],
    );
  }
}
