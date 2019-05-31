import 'package:flutter/material.dart';
import 'package:shake_shake/ui/shake_view.dart';

void main() => runApp(ShakeApp());

class ShakeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shake Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Shake App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;

  ShakeController _shakeController;

  @override
  void initState() {
    _shakeController =
        ShakeController(vsync: this, duration: Duration(milliseconds: 10));
    super.initState();
  }

  void _incrementCounter() {
    setState(() => _counter++);
    _shakeController.shake();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Padding(padding: EdgeInsets.all(10)),
            ShakeView(
                controller: _shakeController,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Theme.of(context).accentColor,
                  child: Center(
                      child: Text('$_counter',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30))),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }
}
