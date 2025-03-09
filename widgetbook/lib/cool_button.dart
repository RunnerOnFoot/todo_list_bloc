import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:to_do_list_bloc/cool_button.dart';

@widgetbook.UseCase(name: 'Default', type: CoolButton)
Widget buildCoolButtonUseCase(BuildContext, context) {
  return CoolButton(label: 'WHAT', onPressed: () {});
}
