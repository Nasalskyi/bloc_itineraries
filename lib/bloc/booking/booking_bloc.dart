import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_itineraries/data/models/booking/email.dart';
import 'package:bloc_itineraries/data/models/booking/name.dart';
import 'package:bloc_itineraries/data/models/booking/phone.dart';
import 'package:bloc_itineraries/data/models/booking/size.dart';
import 'package:formz/formz.dart';
import 'package:http/http.dart' as http;

import 'booking_event.dart';
import 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final _nameController = StreamController<String>();
  Stream<String> get nameStream => _nameController.stream;
  final _emailController = StreamController<String>();
  Stream<String> get emailStream => _emailController.stream;
  BookingBloc() : super(const BookingState()) {
    on<NameChanged>(_onNameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PhoneChanged>(_onPhoneChanged);
    on<SizeChanged>(_onSizeChanged);
    on<CommentChanged>(_onCommentChanged);
    on<NameUnfocused>(_onNameUnfocused);
    on<EmailUnfocused>(_onEmailUnfocused);
    on<PhoneUnfocused>(_onPhoneUnfocused);
   // on<SizeUnfocused>(_onSizeUnfocused);
    on<CommentUnfocused>(_onCommentUnfocused);
    on<FormSubmitted>(_onFormSubmitted);
    on<TryBooking>(_tryBooking);

  }

  @override
  void onTransition(Transition<BookingEvent, BookingState> transition) {
    //print(transition);
    super.onTransition(transition);
  }

  void _onNameChanged(NameChanged event, Emitter<BookingState> emit) {
    final name = Name.dirty(event.name);
    emit(state.copyWith(
      name: name.valid ? name : Name.pure(event.name),
      status: Formz.validate([name, state.email, state.phone, state.size]),
    ));
  }

  void _onEmailChanged(EmailChanged event, Emitter<BookingState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email.valid ? email : Email.pure(event.email),
      status: Formz.validate([state.name, email, state.phone, state.size]),
    ));
  }

  void _onPhoneChanged(PhoneChanged event, Emitter<BookingState> emit) {
    final phone = Phone.dirty(event.phone);
    emit(state.copyWith(
      phone: phone.valid ? phone : Phone.pure(event.phone),
      status: Formz.validate([state.name, state.email, phone, state.size]),
    ));
  }
  void _onSizeChanged(SizeChanged event, Emitter<BookingState> emit) {
    final size = Size.dirty(event.size);
    emit(state.copyWith(
      size: size.valid ? size : Size.pure(event.size),
      status: Formz.validate([state.name, state.email, state.phone, size]),
    ));
  }
  void _onCommentChanged(CommentChanged event, Emitter<BookingState> emit) {
    final comment = event.comment;
    emit(state.copyWith(
      comment: comment,
      status: Formz.validate([state.name, state.email, state.phone, state.size]),
    ));
  }

  void _onNameUnfocused(NameUnfocused event, Emitter<BookingState> emit) {
    final name = Name.dirty(state.name.value);
    emit(state.copyWith(
      name: name,
      status: Formz.validate([name, state.email, state.phone, state.size]),
    ));
  }

  void _onEmailUnfocused(EmailUnfocused event, Emitter<BookingState> emit) {
    final email = Email.dirty(state.email.value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([state.name, email, state.phone, state.size]),
    ));
  }

  void _onPhoneUnfocused(PhoneUnfocused event, Emitter<BookingState> emit) {
    final phone = Phone.dirty(state.phone.value);
    emit(state.copyWith(
      phone: phone,
      status: Formz.validate([state.name, state.email, phone, state.size]),
    ));
  }
 /* void _onSizeUnfocused(SizeUnfocused event, Emitter<BookingState> emit) {
    final size = Size.dirty(state.size.value);
    emit(state.copyWith(
      size: size,
      status: Formz.validate([state.name, state.email, state.phone, size]),
    ));
  }*/
  void _onCommentUnfocused(CommentUnfocused event, Emitter<BookingState> emit) {
    final comment = state.comment;
    emit(state.copyWith(
      comment: comment,
      status: Formz.validate([state.name, state.email, state.phone, state.size]),
    ));
  }
  void _onFormSubmitted(FormSubmitted event, Emitter<BookingState> emit) async {
    final email = Email.dirty(state.email.value);
    final name = Name.dirty(state.name.value);
    final phone = Phone.dirty(state.phone.value);
    final size = Size.dirty(state.size.value);
    emit(state.copyWith(
      name: name,
      email: email,
      phone: phone,
      size: size,
      status: Formz.validate([name, email, phone, size]),
    ));
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }
  void _tryBooking(TryBooking event, Emitter<BookingState> emit) async {
    //will be logic with send post to our site
    final response = await http.post(
      Uri.parse('https://po-belu-svetu.zp.ua/wp-json/custom-plugin-to-send-mail/v1/send-mail'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': event.itinerary.title,
        'name' : state.name.value,
        'email' : state.email.value,
        'phone' : state.phone.value,
        'group_size' : state.size.value.toString(),
        'comment' : state.comment
      }),
    );
  }
  /*updateName(String text) {
    (text == "" && text.length < 5)
        ? _nameController.sink.addError("Invalid value entered!")
        : _nameController.sink.add(text);
  }
  updateEmail(String text) {
    (text == "")
        ? _emailController.sink.addError("Invalid value entered!")
        : _emailController.sink.add(text);
  }*/
}


