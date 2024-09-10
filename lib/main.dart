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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Vegetable Sellers Near Me'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> sellers = [
    {
      'name': 'Seller 1',
      'location': 'Location 1',
      'averagePrice': 10.0,
    },
    {
      'name': 'Seller 2',
      'location': 'Location 2',
      'averagePrice': 8.0,
    },
    {
      'name': 'Seller 3',
      'location': 'Location 3',
      'averagePrice': 12.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    sellers.sort((a, b) => a['averagePrice'].compareTo(b['averagePrice']));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: sellers.length,
        itemBuilder: (context, index) {
          final seller = sellers[index];
          return ListTile(
            title: Text(seller['name']),
            subtitle: Text('Location: ${seller['location']}'),
            trailing: Text('\$${seller['averagePrice']}'),
          );
        },
      ),
    );
  }
}
