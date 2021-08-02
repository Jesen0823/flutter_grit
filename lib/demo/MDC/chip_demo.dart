import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  const ChipDemo({Key? key}) : super(key: key);

  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {

  List<String> _tags = ['QQ','Wechat','Weibo','Xigua'];
  String _action = 'Nothing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Wrap可以自动换行，子view之间不需要Size的Box()
            Wrap(
              spacing: 8.0,
              runSpacing: 10.0,
              children: [
                Chip(
                    label: Text('Life'),
                ),
                Chip(
                  label: Text('Flower'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('Apple'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: Text('周'),
                  ),
                ),
                Chip(
                  label: Text('Shanghai'),
                  avatar: CircleAvatar(
                    backgroundImage: AssetImage("assets/advert_2.jpg"),
                  ),
                ),
                Chip(
                  label: Text('Hangzhou'),
                  avatar: CircleAvatar(
                    backgroundImage: AssetImage("assets/advert_1.jpg"),
                  ),
                ),
                Chip(
                  label: Text('City'),
                  onDeleted: (){},
                  deleteIcon: Icon(Icons.delete_rounded),
                  deleteIconColor: Colors.pinkAccent,
                  deleteButtonTooltipMessage: 'Removed it',
                ),
                Divider(
                  color: Colors.blueGrey,
                  height: 32.0,
                  // 缩进
                  indent: 10.0,
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map(
                      (tag){
                        return Chip(
                          label: Text(tag),
                          deleteIcon: Icon(Icons.clear),
                          deleteIconColor: Colors.pinkAccent,
                          onDeleted: (){
                            setState(() {
                              _tags.remove(tag);
                            });
                          },
                        );
                      }
                  ).toList(),
                ),
                Divider(
                  color: Colors.blueGrey,
                  height: 32.0,
                  // 缩进
                  indent: 10.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('ActionChip: $_action'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map(
                          (tag){
                        return ActionChip(
                          label: Text(tag),
                          backgroundColor: Colors.grey[700],

                          onPressed: (){
                            setState(() {
                              _action = tag;
                            });
                          },
                        );
                      }
                  ).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags =['ios','android','flutter','OS'];
          });
        },
      ),
    );
  }
}
