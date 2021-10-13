import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Widget Example';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget{
  WidgetApp({Key? key}) : super(key: key);
  @override
  _WidgetExampleState createState() => _WidgetExampleState();
}
class _WidgetExampleState extends State<WidgetApp> {
  List<String> _buttonList = ['더하기', '빼기', '곱하기', '나누기'];
  List<DropdownMenuItem<String>> _dropDownMenuItems = [];
  late String _buttonText;

  String sum='';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Example'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(15),
              child: Text('flutter'),
              ),
              Padding(padding: EdgeInsets.all(15),
                child:Text(
                  '결과 : $sum',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(keyboardType: TextInputType.number, controller: value1),
              ),
              Padding(padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(keyboardType: TextInputType.number, controller: value2),
              ),
              Padding(padding: EdgeInsets.all(15),
              child: RaisedButton(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      Text('더하기')
                    ],
                  ),
                  color: Colors.amber,
                  onPressed: (){
                    setState(() {
                      int result = int.parse(value1.value.text) + int.parse(value2.value.text);
                      sum = '$result';
                    });
                  }),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: DropdownButton(items: _dropDownMenuItems, onChanged: (value){
                  setState(() {
                    _buttonText = value;
                  });
                }, value: _buttonText,),
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState(){
    super.initState();
    for(var item in _buttonList){
      _dropDownMenuItems.add(DropdownMenuItem(value:item, child: Text(item)));
    }
    _buttonText = _dropDownMenuItems[0].value!;
  }
}