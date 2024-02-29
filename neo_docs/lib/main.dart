import 'package:flutter/material.dart';
import 'package:neo_docs/controller/arrow_marker.dart';
import 'package:neo_docs/view/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ArrowPositionProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NeoDocsTask',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
