import 'package:flutter/material.dart';
import 'package:kino_actor/animation_slider/widgets/radio_button.widget.dart';
import 'package:kino_actor/animation_slider/widgets/slider_animation.widget.dart';

class AnimationAll extends StatefulWidget {
  const AnimationAll({Key? key}) : super(key: key);

  @override
  State<AnimationAll> createState() => _AnimationAllState();
}

enum RadioButtonNumber { one, two, three }

class _AnimationAllState extends State<AnimationAll> {
  double currentSliderValue = 1000;
  RadioButtonNumber? _numberOfRadioButton = RadioButtonNumber.one;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RadioButton(
                animatedDuration:
                    Duration(milliseconds: currentSliderValue.round()),
                groupValue: _numberOfRadioButton,
                onChanged: (RadioButtonNumber? value) {
                  setState(() {
                   _numberOfRadioButton = value;
                  });
                },
                value: RadioButtonNumber.one,
                colour: Colors.blue,
              ),
              RadioButton(
                animatedDuration:
                    Duration(milliseconds: currentSliderValue.round()),
                groupValue: _numberOfRadioButton,
                onChanged: (RadioButtonNumber? value) {
                  setState(() {
                    _numberOfRadioButton = value;
                  });
                },
                value: RadioButtonNumber.two,
                colour: Colors.green,
              ),
              RadioButton(
                animatedDuration:
                    Duration(milliseconds: currentSliderValue.round()),
                groupValue: _numberOfRadioButton,
                onChanged: (RadioButtonNumber? value) {
                  setState(() {
                    _numberOfRadioButton = value;
                  });
                },
                value: RadioButtonNumber.three,
                colour: Colors.yellow,
              ),
            ],
          ),
          Center(
            child: Text(
              "Animation duration ",
              style: TextStyle(fontSize: 18),
            ),
          ),
          SliderAnimation(),
          Center(
            child: Text("${0.round()} ms"),
          ),
        ],
      ),
    );
  }
}
