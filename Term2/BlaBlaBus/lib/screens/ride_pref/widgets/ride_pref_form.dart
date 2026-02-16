import 'package:blabla/Term2/BlaBlaBus/lib/screens/ride_pref/widgets/ride_form_field.dart';
import 'package:blabla/Term2/BlaBlaBus/lib/widgets/display/bla_divider.dart';
import 'package:flutter/material.dart';

import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';

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

  const RidePrefForm({super.key, this.initRidePref});

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
  void initValue() {
    if (widget.initRidePref != null) {
      departure = widget.initRidePref!.departure;
      departureDate = widget.initRidePref?.departureDate ?? DateTime.now();
      arrival = widget.initRidePref!.arrival;
      requestedSeats = widget.initRidePref!.requestedSeats;
    }
  }

  @override
  void initState() {
    super.initState();
    // TODO
    initValue();
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------

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
        RideFormField(
          label: departure?.name,
          hint: "Leaving from",
          icon: Icons.location_on,
        ),
        RideFormField(
          label: arrival?.name,
          hint: "Going to",
          icon: Icons.location_on,
        ),
        BlaDivider(),
        RideFormField(
          label: departureDate,
          hint: "Today",
          icon: Icons.location_on,
        ),
        RideFormField(
          label: arrival?.name,
          hint: "Today",
          icon: Icons.location_on,
        ),
      ],
    );
  }
}
