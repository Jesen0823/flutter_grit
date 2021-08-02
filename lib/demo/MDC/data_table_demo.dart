import 'package:flutter/material.dart';
import 'package:flutter_grit/model/post.dart';

class DataTableDemo extends StatefulWidget {
  const DataTableDemo({Key? key}) : super(key: key);

  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
        elevation: 1.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SimpleDataTable(),
            DataTable(
              sortColumnIndex: _sortColumnIndex,
              // 升序排列
              sortAscending: _sortAscending,
              // 全选
              onSelectAll: (value) {},
              columns: [
                DataColumn(
                  label: Container(
                    width: 70.0,
                    child: Text('Title'),
                  ),
                  onSort: (int index, bool ascending) {
                    setState(() {
                      _sortColumnIndex = index;
                      _sortAscending = ascending;

                      // 排序规则
                      posts.sort((a, b) {
                        if (!ascending) {
                          final c = a;
                          a = b;
                          b = c;
                        }
                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                  },
                ),
                DataColumn(label: Text('Author')),
                DataColumn(label: Text('Image')),
              ],
              rows: posts.map((post) {
                return DataRow(
                  // 表格的行的选择
                  selected: post.selected,
                  // 勾选选项回调
                  onSelectChanged: (value) {
                    setState(() {
                      if (post.selected != value) {
                        post.selected = value!;
                      }
                    });
                  },
                  cells: [
                    DataCell(Text(post.title)),
                    DataCell(Text(post.author)),
                    DataCell(Image.network(post.imageUrl)),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(
          label: Text('Title'),
        ),
        DataColumn(
          label: Text('Author'),
        ),
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(Text('石墨烯抗压抗拉研究')),
            DataCell(Text('杨即兴')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('离散数学的极限域可见性')),
            DataCell(Text('张国庆')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('温室气体与南极圈问题可能性探讨')),
            DataCell(Text('气象研究院')),
          ],
        ),
      ],
    );
  }
}
