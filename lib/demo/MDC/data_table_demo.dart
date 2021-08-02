import 'package:flutter/material.dart';
import 'package:flutter_grit/model/post.dart';

class DataTableDemo extends StatefulWidget {
  const DataTableDemo({Key? key}) : super(key: key);

  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
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
              columns: [
                DataColumn(
                  label: Container(
                    width: 100.0,
                    child: Text('Title'),
                  ),
                ),
                DataColumn(label: Text('Author')),
                DataColumn(label: Text('Image')),
              ],
              rows: posts.map((post) {
                return DataRow(
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
