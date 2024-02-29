import 'package:flutter/material.dart';
import 'package:neo_docs/model/test_section_model.dart';
import 'package:neo_docs/widget/bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(''),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BarWidget(
                testMetadata: [
                  for (final item in [3, 5, 10, 20, 34, 67, 107, 187, 227])
                    TestSection(
                        width: item.toDouble(),
                        color: _getColorForWidth(item.toDouble())),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColorForWidth(double width) {
    if (width == 67) {
      return const Color(0xFFE99416);
    } else if (width == 107) {
      return const Color(0xFF0EBD15);
    } else if (width == 187) {
      return const Color(0xFFE99416);
    } else {
      return const Color(0xFFFB0000);
    }
  }
}
