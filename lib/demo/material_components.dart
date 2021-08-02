import 'package:flutter/material.dart';
import 'package:flutter_grit/demo/button_demo.dart';
import 'package:flutter_grit/demo/checkout_demo.dart';
import 'package:flutter_grit/demo/date_time_demo.dart';
import 'package:flutter_grit/demo/dialog/alert_dialog_demo.dart';
import 'package:flutter_grit/demo/dialog/simple_dialog.dart';
import 'package:flutter_grit/demo/form_demo.dart';
import 'package:flutter_grit/demo/popup_menu_button.dart';
import 'package:flutter_grit/demo/radio_demo.dart';
import 'package:flutter_grit/demo/slider_demo.dart';
import 'package:flutter_grit/demo/switch_button_demo.dart';

import 'floating_action_button_demo.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          ListItem(
            title: '简单对话框 AlertDialog',
            page: AlertDialogDemo(),
          ),
          ListItem(
            title: '简单对话框 SimpleDialog',
            page: SimpleDialogDemo(),
          ),
          ListItem(
            title: 'DateTimeDemo',
            page: DateTimeDemo(),
          ),
          ListItem(
            title: 'Slider',
            page: SliderDemo(),
          ),
          ListItem(
            title: 'Switch',
            page: SwitchDemo(),
          ),
          ListItem(
            title: 'Radio',
            page: RadioDemo(),
          ),
          ListItem(
            title: 'CheckBox',
            page: CheckoutDemo(),
          ),
          ListItem(
            title: 'Form',
            page: FormDemo(),
          ),
          ListItem(
            title: 'FloatingActionButton',
            page: FloatingActionButtonDemo(),
          ),
          ListItem(
            title: 'Button',
            page: ButtonDemo(),
          ),
          ListItem(
              title: 'PopupMenuButton',
              page: PopupMenuDemo(),
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({
    required this.title,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}


class _WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(),
    );
  }
}
