
import 'package:equatable/equatable.dart';
import 'package:bloc_itineraries/data/models/itinerary.dart';

abstract class BookingEvent extends  Equatable {
  const BookingEvent();

  @override
  List<Object> get props => [];
}

class InitEvent extends BookingEvent {

}

class EmailChanged extends BookingEvent {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class EmailUnfocused extends BookingEvent {}

class NameChanged extends BookingEvent {
  const NameChanged({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

class NameUnfocused extends BookingEvent {}

class PhoneChanged extends BookingEvent {
  const PhoneChanged({required this.phone});

  final String phone;

  @override
  List<Object> get props => [phone];
}

class PhoneUnfocused extends BookingEvent {}
class SizeChanged extends BookingEvent {
  const SizeChanged({required this.size});

  final int size;

  @override
  List<Object> get props => [size];
}

//class SizeUnfocused extends BookingEvent {}

class CommentChanged extends BookingEvent {
  const CommentChanged({required this.comment});

  final String comment;

  @override
  List<Object> get props => [comment];
}

class CommentUnfocused extends BookingEvent {}
class FormSubmitted extends BookingEvent {}

class TryBooking extends BookingEvent {
  const TryBooking({required this.itinerary});

  final Itinerary itinerary;

  @override
  List<Object> get props => [itinerary];
}