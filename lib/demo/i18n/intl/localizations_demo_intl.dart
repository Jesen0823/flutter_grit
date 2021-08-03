import 'package:flutter_grit/demo/i18n/map/localizations_demo.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'nmb_demo_messages_all.dart';

//生成翻译模板命令：
/*flutter pub pub run intl_tr
anslation:extract_to_arb --output-dir=lib/demo/i18n/intl/ lib/demo/i18n/
intl/localizations_demo_intl.dart*/

// 根据模板.arb生成dart文件命令：
// flutter pub pub run intl_translation:generate_from_arb --generated-file-prefix=nmb_demo_ --output-dir=lib/demo/i18n/intl/ --no-use-deferred-loading lib/demo/i18n/intl/localizations_demo_intl.dart lib/demo/i18n/intl/intl_*.arb
// 或 flutter pub pub run intl_translation:generate_from_arb --generated-file-prefix=nmb_demo_ --output-dir=lib/d
// emo/i18n/intl/ --no-use-deferred-loading lib/demo/i18n/intl/localizations_demo_intl.dart lib/demo/i18n/intl/intl_zh.arb lib/demo/i18n/intl/intl_en.arb l
// ib/demo/i18n/intl/intl_messages.arb

class LocalizationDemoIntl {

  static LocalizationDemoIntl? of(BuildContext context){
    return Localizations.of<LocalizationDemoIntl>(
        context, LocalizationDemoIntl
    );
  }

  static Future<LocalizationDemoIntl> load(Locale locale){
    final String name = locale.countryCode!.isEmpty ? locale.languageCode:locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((bool _){
      Intl.defaultLocale = localeName;
      return LocalizationDemoIntl();
    });
  }

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

class LocalizationsDemoDelegate extends LocalizationsDelegate<LocalizationDemoIntl>{
  LocalizationsDemoDelegate();

  @override
  Future<LocalizationDemoIntl> load(Locale locale) {
    return LocalizationDemoIntl.load(locale);
  }

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<LocalizationDemoIntl> old) {
    return false;
  }
}
