import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}
