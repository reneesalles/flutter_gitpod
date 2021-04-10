import 'package:app_client/controller.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amber,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _controller = Controller();

  @override
  void initState() {
    super.initState();
    // _controller.counter.addListener(() {
    //   print('addListener: ${_controller.counter.value}');
    // });

    rxObserver(() {
      print('rxObserver: ${_controller.counter.value}');
    });
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
            // ValueListenableBuilder(
            //   valueListenable: _controller.counter,
            //   builder: (_, value, ___) => Text(
            //     '${_controller.counter.value}',
            //     style: Theme.of(context).textTheme.headline4,
            //   ),
            // ),
            RxBuilder(
              builder: (_) => Text(
                '${_controller.counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _controller.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
