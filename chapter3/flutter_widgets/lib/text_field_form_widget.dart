import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _weatherController = TextEditingController();
  FocusScopeNode focusScopeNode;
  FocusNode _nameFocusNode = new FocusNode();
  FocusNode _passwordFocusNode = new FocusNode();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // 监听输入内容的变化
    _nameController.addListener(() {
      print(_nameController.text);
    });

    _weatherController.text = "今天的天气真好";
    _weatherController.selection = TextSelection(
        baseOffset: 3, extentOffset: _weatherController.text.length);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
      ),
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 18, color: Colors.blue),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              Text('TextField'),
              TextField(
                controller: _nameController,
                maxLines: 1,
                focusNode: _nameFocusNode,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入用户名",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              TextField(
                maxLines: 1,
                focusNode: _passwordFocusNode,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  prefixIcon: Icon(Icons.lock),
                ),
                onChanged: (v) => print("输入的密码是：$v"),
                obscureText: true,
              ),
              RaisedButton(
                child: Text("移动到密码焦点"),
                onPressed: () {
                  if (null == focusScopeNode) {
                    focusScopeNode = FocusScope.of(context);
                  }
                  focusScopeNode.requestFocus(_passwordFocusNode);
                },
              ),
              SizedBox(height: 30),
              Text('修改光标属性'),
              TextField(
                cursorWidth: 10,
                cursorRadius: Radius.circular(5),
                cursorColor: Colors.orange,
                decoration: InputDecoration(
                  labelText: "光标",
                  hintText: "我是光标",
                ),
              ),
              SizedBox(height: 30),
              Text('controller使用'),
              TextField(
                controller: _weatherController,
                decoration: InputDecoration(
                  labelText: "天气情况",
                  hintText: "今天的天气情况",
                ),
              ),
              SizedBox(height: 30),
              Text('Form表单'),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      controller: _nameController,
                      maxLines: 1,
                      validator: (val) =>
                          (val == null || val.isEmpty) ? "用户名不能为空" : null,
                      focusNode: _nameFocusNode,
                      decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "请输入用户名",
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    TextFormField(
                      maxLines: 1,
                      focusNode: _passwordFocusNode,
                      validator: (val) =>
                          (val == null || val.isEmpty) ? "密码不能为空" : null,
                      decoration: InputDecoration(
                        labelText: "密码",
                        hintText: "请输入密码",
                        prefixIcon: Icon(Icons.lock),
                      ),
                      onChanged: (v) => print("输入的密码是：$v"),
                      obscureText: true,
                    ),
                    RaisedButton(
                        child: Text("提交表单"),
                        onPressed: () {
                          final formState = _formKey.currentState as FormState;
                          if (formState.validate()) {
                            // 验证成功后保存表单内容
                            formState.save();
                          }
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
