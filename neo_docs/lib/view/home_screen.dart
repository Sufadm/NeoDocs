import 'package:flutter/material.dart';
import 'package:neo_docs/widget/bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Home'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Group1(
                testMetadata: [
                  TestSection(width: 3, color: const Color(0xFFFB0000)),
                  TestSection(width: 5, color: const Color(0xFFFB0000)),
                  TestSection(width: 10, color: const Color(0xFFFB0000)),
                  TestSection(width: 20, color: const Color(0xFFFB0000)),
                  TestSection(width: 34, color: const Color(0xFFFB0000)),
                  TestSection(width: 67, color: const Color(0xFFE99416)),
                  TestSection(width: 107, color: const Color(0xFF0EBD15)),
                  TestSection(width: 187, color: const Color(0xFFE99416)),
                  TestSection(width: 227, color: const Color(0xFFFB0000)),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
