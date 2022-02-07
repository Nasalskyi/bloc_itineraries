import 'package:bloc_itineraries/data/repositories/itinerary_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_itineraries/data/models/itinerary.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'itinerary_bloc.freezed.dart';
part 'itinerary_bloc.g.dart';
part 'itinerary_event.dart';
part 'itinerary_state.dart';

class ItineraryBloc extends HydratedBloc<ItineraryEvent, ItineraryState> {
  final ItineraryRepo itineraryRepo;
  ItineraryBloc({ required this.itineraryRepo})
      : super(const ItineraryState.loading()) {
    on<ItineraryEventFetch>((event, emit) async {
      emit(const ItineraryState.loading());
      try{
        List<Itinerary> _itineraryLoaded = await itineraryRepo
            .getItinerary();
            //.getItineraryByTitle(event.title)
        emit(ItineraryState.loaded(itineraryLoaded: _itineraryLoaded));
      } catch(e){

        emit(const ItineraryState.error());
        rethrow;
     }
    });
  }

  @override
  ItineraryState? fromJson(Map<String, dynamic> json) => ItineraryState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ItineraryState state) => state.toJson();
}
