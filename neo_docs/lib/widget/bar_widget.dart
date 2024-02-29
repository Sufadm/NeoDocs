import 'package:flutter/material.dart';
import 'package:neo_docs/controller/arrow_marker.dart';
import 'package:neo_docs/model/test_section_model.dart';
import 'package:provider/provider.dart';

class Group1 extends StatelessWidget {
  Group1({Key? key, required this.testMetadata}) : super(key: key);

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
      arrowPosition = 107 + ((enteredValue - 60) / 10) * 25;
    } else if (enteredValue > 70 && enteredValue <= 120) {
      arrowPosition = 187 + ((enteredValue - 70) / 50) * 116;
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
                height: 72,
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
                      left: arrowPositionProvider.arrowPosition,
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
                        if (formKey.currentState!.validate()) {
                          _updateArrowPosition(context);
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
