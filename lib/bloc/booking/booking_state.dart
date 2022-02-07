import 'package:bloc_itineraries/data/models/booking/email.dart';
import 'package:bloc_itineraries/data/models/booking/name.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class BookingState extends Equatable {

  const BookingState({
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.status = FormzStatus.pure,
  });
  final Name name;
  final Email email;
  final FormzStatus status;

  BookingState init() {
    return const BookingState();
  }

  BookingState clone() {
    return const BookingState();
  }

  @override
  List<Object?> get props => [
    name,
    email,
    status
  ];

  BookingState copyWith({
    required Name name,
    required Email email,
    required FormzStatus status,
  }){
    return BookingState(
      name: name ?? this.name,
      email: email ?? this.email,
      status: status ?? this.status,
    );

  }
}
