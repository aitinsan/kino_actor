import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kino_actor/animation_slider/check_box_colors.dart';
import 'package:kino_actor/animation_slider/widgets/check_box.widget.dart';
import 'package:kino_actor/animation_slider/widgets/slider_animation.widget.dart';

class AnimationAll extends StatefulWidget {
  const AnimationAll({Key? key}) : super(key: key);

  @override
  State<AnimationAll> createState() => _AnimationAllState();
}

class _AnimationAllState extends State<AnimationAll> {
  
  double currentSliderValue = 200;

  CheckBoxColor? _colorOfCheckBox = CheckBoxColor.blue;
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
          Wrap(
            spacing: 5.0, // gap between adjacent chips
            runSpacing: 4.0, // gap between lines
            children: _generateChildren(7),
            
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

  Widget _generateItem(int numberColor) {
    //int numberColor = Random().nextInt(3);
    return CheckBox(
      animatedDuration: Duration(milliseconds: currentSliderValue.round()),
      groupValue: _colorOfCheckBox,
      onChanged: (CheckBoxColor? value) {
          setState(() {
            
          });
          print(value);
          _colorOfCheckBox = value;
        
      },
      value: CheckBoxColor.values[numberColor],
      
    );
    
  }

  List<Widget> _generateChildren(int count) {
    List<Widget> checkBoxes = [];
    for (var i = 0; i < count; i++) {
      checkBoxes.add(_generateItem(Random().nextInt(3)));
    }

    return checkBoxes;
  }
}


// children: <Widget>[
            // CheckBox(
            //   animatedDuration:
            //       Duration(milliseconds: currentSliderValue.round()),
            //   groupValue: _colorOfCheckBox,
            //   onChanged: (CheckBoxColor? value) {
            //     setState(() {
            //       _colorOfCheckBox = value;
            //     });
            //   },
            //   value: CheckBoxColor.blue,
            // ),
            //   CheckBox(
            //     animatedDuration:
            //         Duration(milliseconds: currentSliderValue.round()),
            //     groupValue: _colorOfCheckBox,
            //     onChanged: (CheckBoxColor? value) {
            //       setState(() {
            //         _colorOfCheckBox = value;
            //       });
            //     },
            //     value: CheckBoxColor.green,
            //   ),
            //   CheckBox(
            //     animatedDuration:
            //         Duration(milliseconds: currentSliderValue.round()),
            //     groupValue: _colorOfCheckBox,
            //     onChanged: (CheckBoxColor? value) {
            //       setState(() {
            //         _colorOfCheckBox = value;
            //       });
            //     },
            //     value: CheckBoxColor.yellow,
            //   ),
            //   IconButton(
            //     onPressed: () {},
            //     icon: Icon(Icons.add),
            //   )