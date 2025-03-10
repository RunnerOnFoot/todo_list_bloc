import 'package:flutter/material.dart';
import 'package:to_do_list_bloc/cool_button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart';

@UseCase(name: 'Default', type: CoolButton)
Widget defaultCoolButton(BuildContext context) {
  return CoolButton(label: 'Click me', onPressed: () {});
}

@UseCase(name: 'Customizable', type: CoolButton)
Widget customizableCoolButton(BuildContext context) {
  final label = context.knobs.string(
    label: 'Button Label',
    initialValue: 'Click me',
  );

  return CoolButton(label: label, onPressed: () {});
}
