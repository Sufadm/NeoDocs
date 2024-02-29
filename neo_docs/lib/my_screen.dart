// import 'package:flutter/material.dart';

// class MyScreen extends StatefulWidget {
//   const MyScreen({Key? key}) : super(key: key);
//   @override
//   _MyScreenState createState() => _MyScreenState();
// }

// class _MyScreenState extends State<MyScreen> {
//   int inputValue = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TextField & Bar Demo'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const SizedBox(
//               height: 50,
//             ),
//             const SizedBox(height: 10),
//             Row(
//               children: [
//                 Container(
//                     margin: const EdgeInsets.only(left: 80),
//                     child: const Text("30")),
//                 Container(
//                     margin: const EdgeInsets.only(left: 80),
//                     child: const Text("60")),
//                 Container(
//                     margin: const EdgeInsets.only(left: 150),
//                     child: const Text("120")),
//               ],
//             ),
//             Bar(value: inputValue),
//             Row(
//               children: [
//                 const Text("0"),
//                 Container(
//                     margin: const EdgeInsets.only(left: 100),
//                     child: const Text("40")),
//                 Container(
//                     margin: const EdgeInsets.only(left: 100),
//                     child: const Text("70")),
//               ],
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             SizedBox(
//               width: 200, // Adjust the width as per your requirement
//               child: TextField(
//                 onChanged: (newValue) {
//                   setState(() {
//                     inputValue = int.tryParse(newValue) ?? 0;
//                   });
//                 },
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   labelText: 'Enter a value',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             CircleAvatar(
//                 child: IconButton(
//                     onPressed: () {}, icon: const Icon(Icons.arrow_right)))
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Bar extends StatelessWidget {
//   final int value;
//   const Bar({Key? key, required this.value}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<RangeData> ranges = [
//       const RangeData(0, 30, Colors.red),
//       const RangeData(30, 40, Colors.orange),
//       const RangeData(40, 60, Colors.green),
//       const RangeData(60, 70, Colors.orange),
//       const RangeData(70, 120, Colors.red),
//     ];
//     return Stack(
//       children: [
//         Row(
//           children: [
//             for (var range in ranges)
//               Expanded(
//                 flex: range.max - range.min,
//                 child: Container(
//                   color: range.color,
//                   height: 50,
//                   alignment: Alignment.center,
//                 ),
//               ),
//           ],
//         ),
//         Positioned(
//           left: _calculateArrowPosition(value, ranges, context),
//           child: const Icon(Icons.arrow_downward),
//         ),
//       ],
//     );
//   }

//   double _calculateArrowPosition(
//       int value, List<RangeData> ranges, BuildContext context) {
//     double totalWidth = MediaQuery.of(context).size.width;
//     double position = 0;

//     for (var range in ranges) {
//       if (value >= range.min && value <= range.max) {
//         double rangeWidth = (range.max - range.min) / 120 * totalWidth;
//         double valuePosition =
//             ((value - range.min) / (range.max - range.min)) * rangeWidth;
//         return position + valuePosition;
//       } else {
//         position += (range.max - range.min) / 120 * totalWidth;
//       }
//     }

//     return position;
//   }
// }

// class RangeData {
//   final int min;
//   final int max;
//   final Color color;

//   const RangeData(this.min, this.max, this.color);
// }
