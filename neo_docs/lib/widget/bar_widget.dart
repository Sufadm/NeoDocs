// import 'package:flutter/material.dart';

// class Group1 extends StatelessWidget {
//   const Group1({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: 343,
//           height: 72,
//           child: Stack(
//             children: [
//               Positioned(
//                 left: 0,
//                 top: 19,
//                 child: Container(
//                   width: 343,
//                   height: 33,
//                   decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
//                 ),
//               ),
//               Positioned(
//                 left: 0,
//                 top: 19,
//                 child: Container(
//                   width: 67,
//                   height: 33,
//                   decoration: const BoxDecoration(color: Color(0xFFFB0000)),
//                 ),
//               ),
//               Positioned(
//                 left: 227,
//                 top: 19,
//                 child: Container(
//                   width: 116,
//                   height: 33,
//                   decoration: const BoxDecoration(color: Color(0xFFFB0000)),
//                 ),
//               ),
//               Positioned(
//                 left: 67,
//                 top: 19,
//                 child: Container(
//                   width: 40,
//                   height: 33,
//                   decoration: const BoxDecoration(color: Color(0xFFE99416)),
//                 ),
//               ),
//               Positioned(
//                 left: 187,
//                 top: 19,
//                 child: Container(
//                   width: 40,
//                   height: 33,
//                   decoration: const BoxDecoration(color: Color(0xFFE99416)),
//                 ),
//               ),
//               Positioned(
//                 left: 107,
//                 top: 19,
//                 child: Container(
//                   width: 80,
//                   height: 33,
//                   decoration: const BoxDecoration(color: Color(0xFF0EBD15)),
//                 ),
//               ),
//               Row(
//                 children: [
//                   Container(
//                       margin: const EdgeInsets.only(left: 50),
//                       child: const Text("30")),
//                   Container(
//                       margin: const EdgeInsets.only(left: 100),
//                       child: const Text("60")),
//                   Container(
//                       margin: const EdgeInsets.only(left: 120),
//                       child: const Text("120")),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Container(
//                       margin: const EdgeInsets.only(top: 50),
//                       child: const Text("0")),
//                   Container(
//                       margin: const EdgeInsets.only(top: 50, left: 80),
//                       child: const Text("40")),
//                   Container(
//                       margin: const EdgeInsets.only(top: 50, left: 120),
//                       child: const Text("70")),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';

class Group1 extends StatefulWidget {
  const Group1({
    Key? key,
  }) : super(key: key);

  @override
  _Group1State createState() => _Group1State();
}

class _Group1State extends State<Group1> {
  final TextEditingController _textController = TextEditingController();
  double _arrowPosition = 0;

  @override
  void initState() {
    super.initState();
    _textController.addListener(_updateArrowPosition);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _updateArrowPosition() {
    double enteredValue = double.tryParse(_textController.text) ?? 0;
    if (enteredValue >= 0 && enteredValue <= 30) {
      _arrowPosition =
          (enteredValue / 30) * 67; // Position within the range 0 to 30
    } else if (enteredValue > 30 && enteredValue <= 40) {
      _arrowPosition = 67 +
          ((enteredValue - 30) / 10) * 40; // Position within the range 30 to 40
    } else if (enteredValue > 40 && enteredValue <= 70) {
      _arrowPosition = 107 +
          ((enteredValue - 40) / 30) * 80; // Position within the range 40 to 70
    } else if (enteredValue > 70 && enteredValue <= 120) {
      _arrowPosition = 187 +
          ((enteredValue - 70) / 50) *
              116; // Position within the range 70 to 120
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 343,
          height: 72,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 19,
                child: Container(
                  width: 343,
                  height: 33,
                  decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                ),
              ),
              Positioned(
                left: 0,
                top: 19,
                child: Container(
                  width: 67,
                  height: 33,
                  decoration: const BoxDecoration(color: Color(0xFFFB0000)),
                ),
              ),
              Positioned(
                left: 227,
                top: 19,
                child: Container(
                  width: 116,
                  height: 33,
                  decoration: const BoxDecoration(color: Color(0xFFFB0000)),
                ),
              ),
              Positioned(
                left: 67,
                top: 19,
                child: Container(
                  width: 40,
                  height: 33,
                  decoration: const BoxDecoration(color: Color(0xFFE99416)),
                ),
              ),
              Positioned(
                left: 187,
                top: 19,
                child: Container(
                  width: 40,
                  height: 33,
                  decoration: const BoxDecoration(color: Color(0xFFE99416)),
                ),
              ),
              Positioned(
                left: 107,
                top: 19,
                child: Container(
                  width: 80,
                  height: 33,
                  decoration: const BoxDecoration(color: Color(0xFF0EBD15)),
                ),
              ),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 50),
                      child: const Text("30")),
                  Container(
                      margin: const EdgeInsets.only(left: 100),
                      child: const Text("60")),
                  Container(
                      margin: const EdgeInsets.only(left: 120),
                      child: const Text("120")),
                ],
              ),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: const Text("0")),
                  Container(
                      margin: const EdgeInsets.only(top: 50, left: 80),
                      child: const Text("40")),
                  Container(
                      margin: const EdgeInsets.only(top: 50, left: 120),
                      child: const Text("70")),
                ],
              ),
              Positioned(
                left: _arrowPosition,
                top: 0,
                child: Container(
                    margin: const EdgeInsets.only(top: 49, left: 0),
                    child: const Icon(
                      Icons.arrow_drop_up,
                      size: 35,
                    )),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        TextField(
          controller: _textController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Enter a number',
          ),
        ),
      ],
    );
  }
}
