part of 'itinerary_bloc.dart';

@freezed
class ItineraryEvent with _$ItineraryEvent {
  const factory ItineraryEvent.fetch(
    //{required String title}
 ) = ItineraryEventFetch;

}
