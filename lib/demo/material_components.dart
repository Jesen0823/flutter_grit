import 'package:flutter/material.dart';
import 'package:flutter_grit/demo/button_demo.dart';
import 'package:flutter_grit/demo/checkout_demo.dart';
import 'package:flutter_grit/demo/form_demo.dart';
import 'package:flutter_grit/demo/popup_menu_button.dart';

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
