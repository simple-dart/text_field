import 'dart:html';

import 'package:simple_dart_ui_core/simple_dart_ui_core.dart';

class TextField extends Component with ValueChangeEventSource<String>, MixinDisable implements StateComponent<String> {
  TextInputElementBase textInput = TextInputElement();

  @override
  Element get element => textInput;

  TextField({bool password = false}) : super('TextField') {
    if (password) {
      textInput = PasswordInputElement();
    }
    textInput.onInput.listen((event) {
      fireValueChange(value, value);
    });
  }

  set placeholder(String text) {
    textInput.placeholder = text;
  }

  String get placeholder => textInput.placeholder;

  String get value => textInput.value ?? '';

  set value(String value) => textInput.value = value;

  @override
  String get state => value;

  @override
  set state(String newValue) => value = newValue;

  void focus() {
    textInput.focus();
  }
}
