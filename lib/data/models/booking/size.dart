import 'package:formz/formz.dart';

enum SizeError { invalid }

class  Size extends FormzInput<int, SizeError>{
  const Size.pure([int value = 0]) : super.pure(0);
  const Size.dirty([int value = 0]) : super.dirty(value);

  @override
  SizeError? validator(int value) {
    if (value == 0) {
      return SizeError.invalid;
    }
  }


}