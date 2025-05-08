import 'package:flutter/material.dart';
import '../../../layouts/drop_down_button.dart';

class PoseDetector extends StatefulWidget {
  const PoseDetector({Key? key}) : super(key: key);

  @override
  _PoseDetectorState createState() => _PoseDetectorState();
}

class _PoseDetectorState extends State<PoseDetector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(//selections wrapper
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [//selections
              CustomDropdownButton(items: ['option 1','option 2'],)
            ],
          ),
        ),
      ],
    );
  }
}