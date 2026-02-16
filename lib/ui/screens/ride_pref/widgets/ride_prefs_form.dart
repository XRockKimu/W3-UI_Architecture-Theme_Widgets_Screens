import 'package:blabla/ui/widgets/actions/bla_button.dart';
import 'package:flutter/material.dart';

import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';

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
  bool get isValid {
    return departure != null && arrival != null && requestedSeats > 0;
  }
  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          title: Text(departure?.name ?? "Select departure"),
          onTap: () {},
        ),
        ListTile(title: Text(arrival?.name ?? "Select arrival"), onTap: () {}),
        ListTile(
          title: Text("Seats: $requestedSeats"),
          onTap: () {
            setState(() {
              requestedSeats++;
            });
          },
        ),
        BlaButton(
          label: "Search",
          onPressed: isValid
              ? () {
                  final pref = RidePref(
                    departure: departure!,
                    arrival: arrival!,
                    departureDate: departureDate,
                    requestedSeats: requestedSeats,
                  );

                  widget.onSubmit?.call(pref);
                }
              : null,
        ),
      ],
    );
  }
}
