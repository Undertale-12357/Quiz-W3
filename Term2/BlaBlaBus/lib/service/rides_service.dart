import '../dummy_data/dummy_data.dart';
import '../model/ride/locations.dart';
import '../model/ride/ride.dart';

class RidesService {
  static List<Ride> availableRides = fakeRides; // TODO for now fake data

  //
  //  filter the rides starting from given departure location
  //
  static List<Ride> _filterByDeparture(Location departure) {
    List<Ride> emptyRides = [];
    List<Location> availableRidesLocations = [];
    for (Ride ride in availableRides) {
      availableRidesLocations.add(ride.departureLocation);
    }
    for (departure in availableRidesLocations) {
      Ride ride = filterBy(departure: departure);
      emptyRides.add(ride);
    }
    filterBy(departure: departure);
    return [];
  }

  //
  //  filter the rides starting for the given requested seat number
  //
  static List<Ride> _filterBySeatRequested(int requestedSeat) {
    return [];
  }

  //
  //  filter the rides   with several optional criteria (flexible filter options)
  //
  static List<Ride> filterBy({Location? departure, int? seatRequested}) {
    return [];
  }
}
