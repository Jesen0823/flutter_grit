import 'package:flutter/material.dart';
import 'package:flutter_grit/demo/i18n/map/localizations_demo.dart';
import 'package:flutter_grit/demo/i18n/intl/localizations_demo_intl.dart';

class I18nDemo extends StatelessWidget {
  const I18nDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${locale.toString()}'),
            Text(
                //LocalizationsDemo.of(context)!.title,
              LocalizationDemoIntl.of(context)!.greet('hello'),
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
