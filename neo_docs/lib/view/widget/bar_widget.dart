import 'package:flutter/material.dart';
import 'package:neo_docs/controller/arrow_marker.dart';
import 'package:neo_docs/model/test_section_model.dart';
import 'package:provider/provider.dart';

class BarWidget extends StatelessWidget {
  BarWidget({Key? key, required this.testMetadata}) : super(key: key);

  final TextEditingController _textController = TextEditingController();
  final List<TestSection> testMetadata;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void _updateArrowPosition(BuildContext context) {
    double enteredValue = double.tryParse(_textController.text) ?? 0;
    double arrowPosition = 0;

    if (enteredValue >= 0 && enteredValue <= 30) {
      arrowPosition = (enteredValue / 30) * 50;
    } else if (enteredValue > 30 && enteredValue <= 40) {
      arrowPosition = 67 + ((enteredValue - 30) / 10) * 15;
    } else if (enteredValue > 40 && enteredValue <= 70) {
      arrowPosition = 107 + ((enteredValue - 40) / 30) * 80;
    } else if (enteredValue > 60 && enteredValue <= 70) {
      arrowPosition = 107 + ((enteredValue - 60) / 10) * 20;
    } else if (enteredValue > 70 && enteredValue <= 120) {
      arrowPosition = 187 + ((enteredValue - 60) / 60) * 116;
    } else {
      arrowPosition = ArrowPositionProvider().arrowPosition;
    }
    Provider.of<ArrowPositionProvider>(context, listen: false)
        .updateArrowPosition(arrowPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ArrowPositionProvider>(
      builder: (context, arrowPositionProvider, _) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 343,
                height: 132,
                child: Stack(
                  children: [
                    for (int i = 0; i < testMetadata.length; i++)
                      Positioned(
                        left: testMetadata[i].width,
                        top: 19,
                        child: Container(
                          width: testMetadata[i].width,
                          height: 33,
                          decoration: BoxDecoration(
                            color: testMetadata[i].color,
                          ),
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
                      bottom: 10,
                      left: arrowPositionProvider.arrowPosition,
                      top: 0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 52),
                            child: Stack(
                              children: [
                                Container(
                                  width: 27,
                                  height: 27,
                                  decoration: const ShapeDecoration(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    shape: StarBorder.polygon(sides: 3),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 20,
                                    left: _textController.text.length == 1
                                        ? 10
                                        : (_textController.text.length == 3
                                            ? 2
                                            : 6),
                                  ),
                                  child: Text(
                                    _textController.text.isNotEmpty
                                        ? _textController.text
                                        : "0",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 55,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 65,
                    child: TextFormField(
                      maxLength: 3,
                      controller: _textController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a number';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        hintText: "Enter the number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 17),
                    child: IconButton(
                      onPressed: () {
                        if (_textController.text.isNotEmpty) {
                          double enteredValue =
                              double.tryParse(_textController.text)!;
                          if (enteredValue <= 120 && enteredValue >= 0) {
                            if (formKey.currentState!.validate()) {
                              _updateArrowPosition(context);
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                      'Entered value should be greater than 0 or less than 120')),
                            );
                          }
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_circle_right,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
