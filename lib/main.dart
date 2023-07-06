import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int x = 0, y = 0;
  double _containerWidth = 200;
  double _containerHeight = 200;
  Color _containerColor = Colors.blue;
  Alignment _containerAlignment = Alignment(0, 0);

  void _changeContainer() {
    setState(() {
      _containerWidth = 300;
      _containerHeight = 300;
      _containerColor = Color.fromARGB(255, 255, 23, 243);
      _containerAlignment = Alignment(0, 0);
    });
  }

  void _clickLeft() {
    setState(() {
      x--;
      _containerAlignment = Alignment(x.toDouble(), y.toDouble());
    });
  }

  void _clickRight() {
    setState(() {
      x++;
      _containerAlignment = Alignment(x.toDouble(), y.toDouble());
    });
  }

  void _clickBotton() {
    setState(() {
      y--;
      _containerAlignment = Alignment(x.toDouble(), y.toDouble());
    });
  }

  void _clickTop() {
    setState(() {
      y++;
      _containerAlignment = Alignment(x.toDouble(), y.toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello world'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 3),
          curve: Curves.elasticInOut,
          alignment: _containerAlignment,
          color: _containerColor,
          width: _containerWidth,
          height: _containerHeight,
          child: TextButton(
            onPressed: _changeContainer,
            child: const Text(
              'Bún vịt',
              style: TextStyle(
                fontSize: 40,
                color: Color.fromARGB(255, 0, 255, 30),
              ),
            ),
          ),
        ),
      ),

  floatingActionButton: Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    FloatingActionButton(
      onPressed: _changeContainer,
      child: const Icon(Icons.add),
    ),
    const SizedBox(height: 10),
    IconButton(
      onPressed: _clickTop,
      icon: const Icon(Icons.keyboard_arrow_up),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: _clickLeft,
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
        IconButton(
          onPressed: _clickRight,
          icon: const Icon(Icons.keyboard_arrow_right),
        ),
      ],
    ),
    IconButton(
      onPressed: _clickBotton,
      icon: const Icon(Icons.keyboard_arrow_down),
    ),
  ],
),


    );
  }
}
