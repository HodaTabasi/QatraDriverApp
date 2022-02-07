import "package:flutter/material.dart";
import 'package:qatar_driver_app/component/order_item.dart';
class StepperPage extends StatefulWidget {
  static String routeName = "/details_screen";
  @override
  _StepperState createState() => _StepperState();
}

class _StepperState extends State<StepperPage> {
  var _index = 0;

  Widget _steps() => Container(
    margin: EdgeInsets.only(top: 10),
    color: Colors.white,
    child: Stepper(
      steps: [
        Step(
          title: Text("First"),
          subtitle: Text("This is our first article"),
          content: Text(
              "In this article, I will tell you how to create a page."),
        ),
        Step(
            title: Text("Second"),
            subtitle: Text("Constructor"),
            content: Text("Let's look at its construtor."),
            state: StepState.editing,
            isActive: true),
        Step(
            title: Text("Third"),
            subtitle: Text("Constructor"),
            content: Text("Let's look at its construtor."),
            state: StepState.error),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stepper'),
        ),
        body: Column(
          children: <Widget>[
            // OrderItem(),
          ],
        ));
  }
}
