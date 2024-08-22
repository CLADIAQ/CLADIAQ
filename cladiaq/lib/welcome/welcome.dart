import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.asset('assets/images/ima.jpg'),
                ),
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  'Healthy Spaces Better',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                const Text(
                  'Lives',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Living Well has never been',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 28),
                ),
                const Text(
                  'so easy as with CLADIAQ',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 28),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
          Positioned(
              bottom: 5,
              right: 20,
              child: GestureDetector(
                child: Image.asset('assets/icons/next.png'),
                onTap: () {},
              )),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
