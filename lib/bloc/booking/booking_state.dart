
import 'package:bloc_itineraries/data/models/booking/phone.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_itineraries/data/models/booking/email.dart';
import 'package:bloc_itineraries/data/models/booking/name.dart';
import 'package:bloc_itineraries/data/models/booking/size.dart';
import 'package:formz/formz.dart';

class BookingState extends Equatable {
  const BookingState({
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.phone = const Phone.pure(),
    this.size = const Size.pure(),
    this.comment = '',
    this.status = FormzStatus.pure,
  });

  final Name name;
  final Email email;
  final Phone phone;
  final Size size;
  final String comment;
  final FormzStatus status;

  BookingState copyWith({
    Name? name,
    Email? email,
    Phone? phone,
    Size? size,
    String? comment,
    FormzStatus? status,
  }) {
    return BookingState(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      size: size ?? this.size,
      comment: comment ?? this.comment,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [name, email, phone, size, comment, status];
}

