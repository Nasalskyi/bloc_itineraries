import 'package:freezed_annotation/freezed_annotation.dart';

part 'itinerary.freezed.dart';
part 'itinerary.g.dart';

@freezed
class Itinerary with _$Itinerary {

  const factory Itinerary({
    required int id,
    required String status,
    required String? wpTravelStartDate,
    required String? wpTravelEndDate,
    required String title,
    required String? content,
    required FeaturedImage? featuredImage,
    required String? wpTravelPrice,
    required String? wpTravelGroupSize,
    required String? wpTravelTripInclude,
    required String? wpTravelTripExclude,
    required String? wpTravelOutline,
    required List<WPTravelTripItineraryData>? wpTravelTripItineraryData,
    required List<String>? wpTravelItineraryGalleryIds,
    required String? wpTravelEnableSale,
    required String? wpTravelSalePrice,
    required List<String>? wpTravelFaqQuestion,
    required List<String>? wpTravelFaqAnswer,
    required String link
}) = _Itinerary;

  factory Itinerary.fromJson(Map<String,dynamic> json) => _$ItineraryFromJson(json);
}

@freezed
class FeaturedImage with _$FeaturedImage  {
  const factory FeaturedImage({
    required int id,
    required String url,
    required String alt
}) = _FeaturedImage;

  factory FeaturedImage.fromJson(Map<String,dynamic> json) => _$FeaturedImageFromJson(json);
}

@freezed
class WPTravelTripItineraryData with _$WPTravelTripItineraryData {
  const factory WPTravelTripItineraryData({
    required String label,
    required String title,
    required String date,
    required String time,
    required String desc
}) = _WPTravelTripItineraryData;

  factory WPTravelTripItineraryData.fromJson(Map<String,dynamic> json) => _$WPTravelTripItineraryDataFromJson(json);
}