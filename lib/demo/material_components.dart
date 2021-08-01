import 'package:flutter/material.dart';

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
            title: 'FloatingActionButton',
            page: FloatingActionButtonDemo(),
          ),
          ListItem(
            title: 'Button',
            page: _WidgetDemo(),
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

// 第一个button案例：FloatingActionButton
class FloatingActionButtonDemo extends StatelessWidget {
  final Widget _floatingActionButton = FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
    elevation: 0.0,
    backgroundColor: Colors.black12,
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
  );

  final Widget _floatingActionButtonNoShape = FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
    elevation: 0.0,
    backgroundColor: Colors.black12,
  );

  final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
    onPressed: () {},
    label: Text('Add'),
    icon: Icon(Icons.add),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _floatingActionButtonExtended,
          SizedBox(
            height: 32.0,
          ),
          _floatingActionButton,
          SizedBox(
            height: 32.0,
          ),
          _floatingActionButtonNoShape,
        ],
      ),
      floatingActionButton: _floatingActionButtonNoShape,
      // 位置设置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
          color: Colors.grey[500],
        ),
        shape: CircularNotchedRectangle(),
      ),
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
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      splashFactory: InkSplash.splashFactory,
                      shadowColor: Colors.blueGrey,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Colors.grey[300]),
                  onPressed: () {},
                  child: const Text(
                    'TextButton',
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    splashFactory: InkSplash.splashFactory,
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                    backgroundColor: Colors.brown[300],
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'TextButton',
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                    backgroundColor: Colors.grey[800],
                    shape: CircleBorder(),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'C',
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    splashFactory: InkSplash.splashFactory,
                    overlayColor:  MaterialStateProperty.all(Colors.blueGrey),
                  ),
                  onPressed: () {
                    print('Received click');
                  },
                  child: const Text(
                    'OutlinedButton',
                    style: TextStyle(color: Colors.deepOrange),
                  ),
                ),
                ClipRect(
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF0D47A1),
                                Color(0xFF42A5F5),
                                Color(0xFFD976D2),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {},
                        child: const Text('Gradient'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text("ElevatedButton 2"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffFFF8E5)), //背景颜色
                    foregroundColor:
                        MaterialStateProperty.all(Color(0xffB85F23)), //字体颜色
                    overlayColor:
                        MaterialStateProperty.all(Color(0xffFFF8E5)), // 高亮色
                    shadowColor:
                        MaterialStateProperty.all(Color(0xffffffff)), //阴影颜色
                    elevation: MaterialStateProperty.all(0), //阴影值
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 12)), //字体
                    side: MaterialStateProperty.all(
                        BorderSide(width: 1, color: Color(0xffffffff))), //边框
                    shape: MaterialStateProperty.all(BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(8))), //圆角弧度
                  ),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: Text("ElevatedButton 3"),
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.red),
                    elevation: MaterialStateProperty.all(10), //阴影值
                  ),
                  onPressed: () {
                    print('我被点击了');
                  },
                ),
                ElevatedButton(
                  child: Text("赞"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffffffff)), //背景颜色
                    foregroundColor:
                        MaterialStateProperty.all(Color(0xff5E6573)), //字体颜色
                    overlayColor: MaterialStateProperty.all(Colors.blue), // 高亮色
                    shadowColor: MaterialStateProperty.all(Colors.greenAccent),
                    elevation: MaterialStateProperty.all(6.0), //阴影值
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 12)), //字体
                    side: MaterialStateProperty.all(
                        BorderSide(width: 1, color: Color(0xffCAD0DB))), //边框
                    shape: MaterialStateProperty.all(CircleBorder(
                        side: BorderSide(
                      //设置 界面效果
                      color: Colors.green,
                      width: 280.0,
                      style: BorderStyle.none,
                    ))), //圆角弧度
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text("ElevatedButton 4"),
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffffffff)), //背景颜色
                    foregroundColor:
                        MaterialStateProperty.all(Color(0xff5E6573)), //字体颜色
                    overlayColor:
                        MaterialStateProperty.all(Color(0xffffffff)), // 高亮色
                    shadowColor:
                        MaterialStateProperty.all(Color(0xffffffff)), //阴影颜色
                    elevation: MaterialStateProperty.all(0), //阴影值
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 12)), //字体
                    side: MaterialStateProperty.all(
                        BorderSide(width: 1, color: Color(0xffCAD0DB))), //边框
                    shape: MaterialStateProperty.all(StadiumBorder(
                        side: BorderSide(
                      //设置 界面效果
                      style: BorderStyle.solid,
                      color: Color(0xffFF7F24),
                    ))), //圆角弧度
                  ),
                ),
                ElevatedButton(
                  child: Text("ElevatedButton 1"),
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Color(0xff31C27C)),
                    side: MaterialStateProperty.all(
                      BorderSide(width: 1, color: Color(0xffffffff)),
                    ), //边框
                    shape: MaterialStateProperty.all(BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(8))), //圆角弧度
                  ),
                  onPressed: () {
                    print('我被点击了');
                  },
                ),
              ],
            ),
            Container(
              height: 50.0,
              child: Expanded(
                child: OutlinedButton.icon(
                  icon: Icon(Icons.add, color: Colors.redAccent,),
                  label: Text("Expanded包裹，占满整个屏幕"),
                  onPressed: (){},
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ButtonBar是一组按钮
                Theme(
                  data: Theme.of(context).copyWith(
                    buttonTheme: ButtonThemeData(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                    )
                  ),
                  child: ButtonBar(
                    children: [
                      TextButton.icon(
                          onPressed: (){},
                          icon: Icon(Icons.save, color: Colors.purple,),
                          label: Text('TextButton.icon 按钮')
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                          overlayColor: MaterialStateProperty.all(Colors.blue[700]),
                          shape: MaterialStateProperty.all(
                              BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0))
                          ),
                        ),
                        child: Text("Submit"),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
