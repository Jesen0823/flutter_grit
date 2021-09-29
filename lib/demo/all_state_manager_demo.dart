import 'package:flutter/material.dart';
import 'package:flutter_grit/demo/MDC/chip_demo.dart';
import 'package:flutter_grit/demo/MDC/data_table_demo.dart';
import 'package:flutter_grit/demo/button_demo.dart';
import 'package:flutter_grit/demo/checkout_demo.dart';
import 'package:flutter_grit/demo/date_time_demo.dart';
import 'package:flutter_grit/demo/dialog/alert_dialog_demo.dart';
import 'package:flutter_grit/demo/dialog/bottom_sheet_demo.dart';
import 'package:flutter_grit/demo/dialog/expansion_panel_demo.dart';
import 'package:flutter_grit/demo/dialog/simple_dialog.dart';
import 'package:flutter_grit/demo/dialog/snackbar_demo.dart';
import 'package:flutter_grit/demo/form_demo.dart';
import 'package:flutter_grit/demo/popup_menu_button.dart';
import 'package:flutter_grit/demo/radio_demo.dart';
import 'package:flutter_grit/demo/slider_demo.dart';
import 'package:flutter_grit/demo/state/state_manager_base_demo.dart';
import 'package:flutter_grit/demo/state/state_manager_parent_demo.dart';
import 'package:flutter_grit/demo/switch_button_demo.dart';

import 'dialog/paging_datatable_demo.dart';
import 'floating_action_button_demo.dart';

class AllStateManagerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State状态管理'),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          ListItem(
            title: '子Widget自己管理状态',
            page: StateManagerBaseDemo(),
          ),
          ListItem(
              title: '由父Widget一级一级向下传递给子Widget',
              page: StateManagementDemo2(),
          ),
          ListItem(
            title: 'inheritedWidget管理状态',
            page: StateManagementDemo2(),
          ),
          ListItem(
            title: '三方 ScopedMode管理状态',
            page: StateManagementDemo2(),
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

