import 'package:flutter_test/flutter_test.dart';
import 'package:blabla/services/rides_service.dart';

void main() {
  RidesService.filterBy(
    departure: Location(name: "Dijon", country: Country.france),
    seatsRequested: 2,
  ); // Shall return 1 ride
  print(result.length);
}
