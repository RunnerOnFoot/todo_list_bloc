import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

final List<WidgetbookTheme> themes = [
  WidgetbookTheme(name: 'Light Theme', data: ThemeData.light()),
  WidgetbookTheme(name: 'Dark Theme', data: ThemeData.dark()),
];

class ThemeAddon extends WidgetbookAddon<WidgetbookTheme> {
  ThemeAddon() : super(name: 'Theme');

  @override
  Widget buildUseCase(
    BuildContext context,
    Widget child,
    WidgetbookTheme setting,
  ) {
    return MaterialApp(theme: setting.data, home: Scaffold(body: child));
  }

  @override
  List<Field> get fields => [
    ListField<WidgetbookTheme>(
      name: 'Theme Mode',
      values: themes,
      initialValue: themes.first,
      labelBuilder: (theme) => theme.name,
    ),
  ];

  @override
  WidgetbookTheme valueFromQueryGroup(Map<String, String> queryGroup) {
    final themeName = queryGroup['Theme Mode'];
    return themes.firstWhere(
      (theme) => theme.name == themeName,
      orElse: () => themes.first,
    );
  }
}
