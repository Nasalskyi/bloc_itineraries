// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Itinerary _$$_ItineraryFromJson(Map<String, dynamic> json) => _$_Itinerary(
      id: json['id'] as int,
      status: json['status'] as String,
      wpTravelStartDate: json['wp_travel_start_date'] as String?,
      wpTravelEndDate: json['wp_travel_end_date'] as String?,
      title: json['title'] as String,
      content: json['content'] as String?,
      featuredImage: json['featured_image'] == null
          ? null
          : FeaturedImage.fromJson(
          json['featured_image'] as Map<String, dynamic>),
      wpTravelPrice: json['wp_travel_price'] as String?,
      wpTravelGroupSize: json['wp_travel_group_size'] as String?,
      wpTravelTripInclude: json['wp_travel_trip_include'] as String?,
      wpTravelTripExclude: json['wp_travel_trip_exclude'] as String?,
      wpTravelOutline: json['wp_travel_outline'] as String?,
      wpTravelTripItineraryData:
      json['wp_travel_trip_itinerary_data'] == ''||
          json['wp_travel_trip_itinerary_data'] == []
          ? [] : List<WPTravelTripItineraryData>.from(
          json['wp_travel_trip_itinerary_data'].map(
                  (i)=>WPTravelTripItineraryData.fromJson(i)
          ).toList()),
      wpTravelItineraryGalleryIds:
      (json['wp_travel_itinerary_gallery_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      wpTravelEnableSale: json['wp_travel_enable_sale'] as String?,
      wpTravelSalePrice: json['wp_travel_sale_price'] as String?,
      wpTravelFaqQuestion: (json['wp_travel_faq_question'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      wpTravelFaqAnswer: (json['wp_travel_faq_answer'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      link: json['link'] as String,
    );

Map<String, dynamic> _$$_ItineraryToJson(_$_Itinerary instance) =>
    <String, dynamic>{
          'id': instance.id,
          'status': instance.status,
          'wp_travel_start_date': instance.wpTravelStartDate,
          'wp_travel_end_date': instance.wpTravelEndDate,
          'title': instance.title,
          'content': instance.content,
          'featured_image': instance.featuredImage,
          'wp_travel_price': instance.wpTravelPrice,
          'wp_travel_group_size': instance.wpTravelGroupSize,
          'wp_travel_trip_include': instance.wpTravelTripInclude,
          'wp_travel_trip_exclude': instance.wpTravelTripExclude,
          'wp_travel_outline': instance.wpTravelOutline,
          'wp_travel_trip_itinerary_data': instance.wpTravelTripItineraryData,
          'wp_travel_itinerary_gallery_ids': instance.wpTravelItineraryGalleryIds,
          'wp_travel_enable_sale': instance.wpTravelEnableSale,
          'wp_travel_sale_price': instance.wpTravelSalePrice,
          'wp_travel_faq_question': instance.wpTravelFaqQuestion,
          'wp_travel_faq_answer': instance.wpTravelFaqAnswer,
          'link': instance.link,
    };

_$_FeaturedImage _$$_FeaturedImageFromJson(Map<String, dynamic> json) =>
    _$_FeaturedImage(
      id: json['id'] as int,
      url: json['url'] as String,
      alt: json['alt'] as String,
    );

Map<String, dynamic> _$$_FeaturedImageToJson(_$_FeaturedImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'alt': instance.alt,
    };

_$_WPTravelTripItineraryData _$$_WPTravelTripItineraryDataFromJson(
        Map<String, dynamic> json) =>
    _$_WPTravelTripItineraryData(
      label: json['label'] as String,
      title: json['title'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      desc: json['desc'] as String,
    );

Map<String, dynamic> _$$_WPTravelTripItineraryDataToJson(
        _$_WPTravelTripItineraryData instance) =>
    <String, dynamic>{
      'label': instance.label,
      'title': instance.title,
      'date': instance.date,
      'time': instance.time,
      'desc': instance.desc,
    };
