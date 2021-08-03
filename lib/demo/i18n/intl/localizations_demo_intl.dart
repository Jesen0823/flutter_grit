import 'package:intl/intl.dart';
//命令：
/*flutter pub pub run intl_tr
anslation:extract_to_arb --output-dir=lib/demo/i18n/intl/ lib/demo/i18n/
intl/localizations_demo_intl.dart*/

class LocalizationDemoIntl {
  String get title => Intl.message(
    'hello',
    name: 'title',
    desc: 'demo localizations',
  );

  String greet(String name) => Intl.message(
    'hello $name',
    name:'greet',
    desc: 'greet nmb',
    args: [name],
  );
}