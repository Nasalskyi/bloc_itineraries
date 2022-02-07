import 'package:formz/formz.dart';

enum NameError {
  empty,
  invalid
}

class Name extends FormzInput<String, NameError> {
  const Name.pure([String value = '']) : super.pure(value);
  const Name.dirty([String value = '']) : super.dirty(value);



  @override
  NameError? validator(String value) {
    if (value?.isNotEmpty == false) {
      return NameError.empty;
    }
    return (value.length>5)
        ? null
        : NameError.invalid;
  }
}

extension Explanation on NameError {
  String? get name {
    switch (this) {
      case NameError.invalid:
        return "This is not a valid name";
      case NameError.empty:
        return "Field with name is empty";
      default:
        return null;
    }
  }

}