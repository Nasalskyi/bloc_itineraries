part of 'itinerary_bloc.dart';

@freezed
class ItineraryState with _$ItineraryState {
  const factory ItineraryState.loading() = ItineraryStateLoading;
  const factory ItineraryState.loaded({required List<Itinerary> itineraryLoaded}) = ItineraryStateLoaded;
  const factory ItineraryState.error() = ItineraryStateError;

  factory ItineraryState.fromJson(Map<String,dynamic> json) => _$ItineraryStateFromJson(json);
}
