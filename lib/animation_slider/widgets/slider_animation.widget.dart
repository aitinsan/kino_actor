import 'package:flutter/material.dart';

class SliderAnimation extends StatefulWidget {
  final ValueChanged<double?>? onSliderChanged;
  SliderAnimation({Key? key, required this.onSliderChanged}) : super(key: key);
  @override
  _SliderAnimationState createState() => _SliderAnimationState();
}

class _SliderAnimationState extends State<SliderAnimation> {
  double currentSliderValue = 200;
  @override
  Widget build(BuildContext context) {
    return Slider(
            value: currentSliderValue,
            min: 200,
            max: 2000,
            divisions: 1800,
            label: currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                 currentSliderValue = value;
                 widget.onSliderChanged!(value);
              });
             
            },
          );
  }
}
