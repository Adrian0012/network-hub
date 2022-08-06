import 'package:formz/formz.dart';

enum UseremailValidationError { empty }

class Email extends FormzInput<String, UseremailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  @override
  UseremailValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : UseremailValidationError.empty;
  }
}
