import 'package:flutter/material.dart';
import 'package:blabla/services/location_service.dart';
import '../../theme/theme.dart';

class LocationPickerScreen extends StatelessWidget {
  const LocationPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locations = LocationsService.availableLocations;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select location"),
      ),
      body: ListView.separated(
        itemCount: locations.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final location = locations[index];

          return ListTile(
            title: Text(
              location.name,
              style: BlaTextStyles.body,
            ),
            onTap: () {
              Navigator.pop(context, location);
            },
          );
        },
      ),
    );
  }
}
