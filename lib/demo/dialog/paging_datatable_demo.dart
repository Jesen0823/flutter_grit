import 'package:flutter/material.dart';
import 'package:flutter_grit/model/post.dart';

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  // 行的数量
  int get rowCount => _posts.length;

  @override
  DataRow? getRow(int index) {
    final Post post = _posts[index];
    // 每一行具体内容
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl)),
      ],
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // 获取选中行数
  int get selectedRowCount => _selectedCount;
}

class PagingDataTableDemo extends StatefulWidget {
  const PagingDataTableDemo({Key? key}) : super(key: key);

  @override
  _PagingDataTableDemoState createState() => _PagingDataTableDemoState();
}

class _PagingDataTableDemoState extends State<PagingDataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  final PostDataSource _postDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PagingDataTableDemo'),
        elevation: 1.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            //SimpleDataTable(),
            PaginatedDataTable(
              header: Text('Posts'),
              // 每页展示的行数
              rowsPerPage: 8,
              // 数据源
              source: _postDataSource,
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
