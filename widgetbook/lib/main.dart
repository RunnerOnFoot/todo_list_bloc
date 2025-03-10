import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'theme_addon.dart' as custom;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [custom.ThemeAddon()],
    );
  }
}
