// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItineraryStateLoading _$$ItineraryStateLoadingFromJson(
        Map<String, dynamic> json) =>
    _$ItineraryStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ItineraryStateLoadingToJson(
        _$ItineraryStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ItineraryStateLoaded _$$ItineraryStateLoadedFromJson(
        Map<String, dynamic> json) =>
    _$ItineraryStateLoaded(
      itineraryLoaded: (json['itineraryLoaded'] as List<dynamic>)
          .map((e) => Itinerary.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ItineraryStateLoadedToJson(
        _$ItineraryStateLoaded instance) =>
    <String, dynamic>{
      'itineraryLoaded': instance.itineraryLoaded,
      'runtimeType': instance.$type,
    };

_$ItineraryStateError _$$ItineraryStateErrorFromJson(
        Map<String, dynamic> json) =>
    _$ItineraryStateError(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ItineraryStateErrorToJson(
        _$ItineraryStateError instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
