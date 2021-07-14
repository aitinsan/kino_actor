import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kino_actor/animation_slider/check_box_colors.dart';
import 'package:kino_actor/animation_slider/widgets/check_box.widget.dart';
import 'package:kino_actor/animation_slider/widgets/slider_animation.widget.dart';

class AnimationAll extends StatefulWidget {
  const AnimationAll({Key? key}) : super(key: key);

  @override
  State<AnimationAll> createState() => _AnimationAllState();
}

class _AnimationAllState extends State<AnimationAll> {
  List<CheckBoxColor> values = [];
  double currentSliderValue = 200;
  int numberOfCheckBoxes = 1;
  CheckBoxColor? _colorOfCheckBox = CheckBoxColor.blue;
  Color colorOfRadio = Colors.blue;
  @override
  void initState() {
    super.initState();
    addColors();
  }

  void addColors() {
    for (var i = 0; i < numberOfCheckBoxes; i++) {
      values.add(
        CheckBoxColor.values[Random().nextInt(3)],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).cardColor,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            reverse: true,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 500),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Wrap(
                          spacing: 5.0, // gap between adjacent chips
                          runSpacing: 4.0, // gap between lines
                          children: _generateChildren(numberOfCheckBoxes),
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
                  ),
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              numberOfCheckBoxes += 10;
                              addColors();
                            });
                          },
                          child: Text('Add checkboxes'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              numberOfCheckBoxes = 0;
                              values = [];
                            });
                          },
                          child: Text('Clear'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _generateItem(int valueIndex) {
    //int numberColor = Random().nextInt(3);
    return CheckBox(
      animatedDuration: Duration(milliseconds: currentSliderValue.round()),
      groupValue: _colorOfCheckBox,
      onChanged: (CheckBoxColor? value) {
        setState(() {});
        print(value);
        _colorOfCheckBox = value;
      },
      value: values[valueIndex], //CheckBoxColor.values[valueIndex],
    );
  }

  List<Widget> _generateChildren(int count) {
    print(values);
    List<Widget> checkBoxes = [];
    for (var i = 0; i < count; i++) {
      checkBoxes.add(_generateItem(i));
    }

    return checkBoxes;
  }
}
