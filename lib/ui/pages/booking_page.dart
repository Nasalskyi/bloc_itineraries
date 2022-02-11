import 'package:bloc_itineraries/bloc/booking/booking_bloc.dart';
import 'package:bloc_itineraries/bloc/booking/booking_event.dart';
import 'package:bloc_itineraries/bloc/booking/booking_state.dart';
import 'package:flutter/material.dart';
import 'package:bloc_itineraries/data/models/itinerary.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:numberpicker/numberpicker.dart';

class BookingPage extends StatelessWidget {
  final Itinerary itinerary;
  const BookingPage({Key? key, required this.itinerary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Форма бронирования поездки'),
          backgroundColor: Colors.black54,
          centerTitle: true),
      body: BlocProvider(
        create: (_) => BookingBloc(),
        child: BookingForm(itinerary: itinerary),
      ),
    );
  }
}

class BookingForm extends StatefulWidget {
  final Itinerary itinerary;
  const BookingForm({Key? key, required this.itinerary}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<BookingForm> {
  final _emailFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _commentFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    //FocusScope.of(context).requestFocus(_nameFocusNode);
    _nameFocusNode.addListener(() {
      if (!_nameFocusNode.hasFocus) {
        context.read<BookingBloc>().add(NameUnfocused());
      }
    });
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<BookingBloc>().add(EmailUnfocused());
      }
    });
    _phoneFocusNode.addListener(() {
      if (!_phoneFocusNode.hasFocus) {
        context.read<BookingBloc>().add(PhoneUnfocused());
      }
    });
    _commentFocusNode.addListener(() {
      if (!_commentFocusNode.hasFocus) {
        context.read<BookingBloc>().add(CommentUnfocused());
      }
    });

  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _commentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingBloc, BookingState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          showDialog<void>(
            context: context,
            builder: (_) => const SuccessDialog(),
          );
        }
        if (state.status.isSubmissionInProgress) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Submitting...')),
            );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              NameInput(focusNode: _nameFocusNode),
              EmailInput(focusNode: _emailFocusNode),
              PhoneInput(focusNode: _phoneFocusNode),
              SizeInput(),
              CommentInput(focusNode: _commentFocusNode),
              SubmitButton(itinerary: widget.itinerary),
            ],
          ),
        ),
      ),
    );
  }
}

class NameInput extends StatelessWidget {
  const NameInput({Key? key, required this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            initialValue: state.name.value,
            focusNode: focusNode,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.person),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
              //helperText: '''Введите вашу фамилию имя''',
              //helperMaxLines: 2,
              labelText: 'Ваши фамилия имя',
              errorMaxLines: 2,
              errorText: state.name.invalid
                  ? '''Поле должно быть больше 5 символов'''
                  : null,
            ),
            obscureText: false,
            onChanged: (value) {
              context.read<BookingBloc>().add(NameChanged(name: value));
            },
            textInputAction: TextInputAction.done,
          ),
        );
      },
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key, required this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            initialValue: state.email.value,
            focusNode: focusNode,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.email),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
              labelText: 'Почтовый ящик',
              helperText: 'Должно выглядеть примерно как: joe@gmail.com',
              errorText: state.email.invalid
                  ? 'Пожалуйста, введите верный почтовый ящик!'
                  : null,
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              context.read<BookingBloc>().add(EmailChanged(email: value));
            },
            textInputAction: TextInputAction.next,
          ),
        );
      },
    );
  }
}
class PhoneInput extends StatelessWidget {
  const PhoneInput({Key? key, required this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            initialValue: state.phone.value,
            focusNode: focusNode,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.phone),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
              labelText: 'Телефонный номер',
              //helperText: 'Введите в формате +38(999)999-99-99',
              errorText: state.phone.invalid
                  ? 'Пожалуйста, введите верный номер!'
                  : null,
            ),
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              context.read<BookingBloc>().add(PhoneChanged(phone: value));
            },
            textInputAction: TextInputAction.next,
          ),
        );
      },
    );
  }
}
class SizeInput extends StatelessWidget {
  const SizeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Количество:', style: TextStyle(color: Colors.black54)),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  if (state.size.value != 0){
                    context.read<BookingBloc>().add(SizeChanged(size: state.size.value - 1));
                  }
                }),
              NumberPicker(
                itemWidth: MediaQuery.of(context).size.width/12,
                value: state.size.value,
                minValue: 0,
                maxValue: 20,
                step: 1,
                haptics: false,
                axis: Axis.horizontal,
                onChanged: (value) => context.read<BookingBloc>().add(SizeChanged(size: value)),
              ),
              IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (state.size.value != 20){
                      context.read<BookingBloc>().add(SizeChanged(size: state.size.value + 1));
                    }
                  }),
            ],
          ),
        );
      },
    );
  }
}
class CommentInput extends StatelessWidget {
  const CommentInput({Key? key, required this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.comment,
          focusNode: focusNode,
            decoration: const InputDecoration(
         //   icon: const Icon(Icons.phone)
              hoverColor: Colors.green,
              border: OutlineInputBorder(),
              labelText: 'Комментарий к бронированию:',
              filled: true
              //labelStyle: TextStyle(color: Colors.green)
            //helperText: 'Введите в формате +38(999)999-99-99',
            //errorText: state.phone.invalid
            //    ? 'Пожалуйста, введите верный номер!'
            //    : null,
          ),
          keyboardType: TextInputType.text,
          maxLines: 5,
          maxLength: 150,
          onChanged: (value) {
            context.read<BookingBloc>().add(CommentChanged(comment: value));
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class SubmitButton extends StatelessWidget {
  final Itinerary itinerary;
  const SubmitButton({Key? key, required this.itinerary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.status.isValidated
              ? () => context.read<BookingBloc>().add(TryBooking(itinerary: itinerary))
              : null,
          child: const Text('Забронировать'),
        );
      },
    );
  }
}

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              children: const <Widget>[
                Icon(Icons.info),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Form Submitted Successfully!',
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}