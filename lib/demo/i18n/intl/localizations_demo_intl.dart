import 'package:intl/intl.dart';

class LocalizationDemoIntl {
  String get title => Intl.message(
    'hello',
    name: 't',
    desc: 'demo localizations',
  );

  String greet(String name) => Intl.message(
    'hello $name',
    name:'greet',
    desc: 'greet nmb',
    args: [name],
  );
}