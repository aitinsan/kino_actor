import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kino_actor/animation_slider/widgets/radio_button.widget.dart';
import 'package:kino_actor/animation_slider/widgets/slider_animation.widget.dart';

class AnimationAll extends StatefulWidget {
  const AnimationAll({Key? key}) : super(key: key);

  @override
  State<AnimationAll> createState() => _AnimationAllState();
}

enum RadioButtonNumber { blue, green, yellow }

class _AnimationAllState extends State<AnimationAll> {
  double currentSliderValue = 200;

  RadioButtonNumber? _numberOfRadioButton = RadioButtonNumber.blue;
  Color colorOfRadio = Colors.blue;
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
                value: RadioButtonNumber.blue,
                
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
                value: RadioButtonNumber.green,
                
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
                value: RadioButtonNumber.yellow,
                
              ),
            ],
          ),
          Center(
            child: Text(
              "Animation duration ",
              style: TextStyle(fontSize: 18),
            ),
          ),
          SliderAnimation(
            onSliderChanged: (double? value) {
              setState(() {
                currentSliderValue = value!;
              });
            },
          ),
          Center(
            child: Text("${currentSliderValue.round()} ms"),
          ),
        ],
      ),
    );
  }
}
