/*
* 表单相关
* */

import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: ThemeDemo(),

      // 自定义主题，覆盖全局主题
      /*body: Theme(
        data: ThemeData(
          primaryColor: Colors.green,
        ),
        child: ThemeDemo(),
      ),*/
      body: Theme(
        data: ThemeData(
          primaryColor: Colors.green,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegisterFormDemo(),
            ],
          ),
        ),
      ),

      // 覆盖的时候，除了指定的primaryColor属性被覆盖，其他的仍保留全局
      /*body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.blueGrey,
        ),
        child: ThemeDemo(),
      ),*/
    );
  }
}

// 表单案例2：注册用户TextField
class RegisterFormDemo extends StatefulWidget {
  @override
  _RegisterFormDemoState createState() => _RegisterFormDemoState();
}

class _RegisterFormDemoState extends State<RegisterFormDemo> {
  GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  String userName = '';
  String password = '';
  // 是否自动验证
  AutovalidateMode _autovalidate = AutovalidateMode.disabled;

  void _submitRegisterForm() {
    debugPrint('click _submitRegisterForm');
    if (_registerFormKey.currentState!.validate()) {
      _registerFormKey.currentState!.save();
      debugPrint('userName: $userName, passWord: $password');

      // 添加SnackBar提示
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("register success."),
          duration: Duration(
            milliseconds: 3000,
          ),
          action: SnackBarAction(
              label: "别点我",
              onPressed: () {
                print("SnackBar上面的按钮被点击了");
              }),
        ),
      );
    } else {
      setState(() {
        _autovalidate = AutovalidateMode.always;
      });
    }
  }

  String? _validatorUserName(value) {
    if (value.isEmpty) {
      return 'UserName is required';
    }
    return null;
  }

  String? _validatorPassword(value) {
    if (value.isEmpty) {
      return 'password is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'UserName',
              // 预置字段，用来提示信息，比如错误信息
              helperText: '',
            ),
            onSaved: (value) {
              userName = value!;
            },
            // 验证表单数据
            validator: _validatorUserName,
            // 自动验证表单数据
            //autovalidate: _autovalidate,
            autovalidateMode: _autovalidate,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              // 预置字段，用来提示信息，比如错误信息
              helperText: '',
            ),
            onSaved: (value) {
              password = value!;
            },
            // 验证表单数据
            validator: _validatorPassword,
            //autovalidate: _autovalidate,
            autovalidateMode: _autovalidate,
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  primary: Theme.of(context).accentColor,
                  elevation: 2.0,
                ),
                onPressed: _submitRegisterForm,
                child: const Text('Register')),
          ),
        ],
      ),
    );
  }
}

// 表单案例1： TextField
class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //_textEditingController.text = 'hi';
    _textEditingController.addListener(() {
      debugPrint('_textEditingController, ${_textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'Title',
        hintText: 'Enter the post title',
        // 文本底部边框,默认是横线边框
        //border: InputBorder.none,
        //border: OutlineInputBorder(),

        // 背景被灰色充满
        filled: true,
      ),
      // 每输入一个字符回调一次
      onChanged: (value) {
        debugPrint('input:$value');
      },
      // 输入完成，回调一次最终结果
      onSubmitted: (value) {
        debugPrint('submitted:$value');
      },
      controller: _textEditingController,
    );
  }
}

// 自定义主题
class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // main.dart定义的使用全局主题
      // 该色彩就是main.dart定义的primarySwatch
      color: Theme.of(context).primaryColor,
      // 使用另外一种全局色彩
      //color: Theme.of(context).accentColor,
    );
  }
}
