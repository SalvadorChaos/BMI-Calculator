import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/reusable_bottom_button.dart';
import '../components/reusable_card.dart';
import '../components/reusable_icon.dart';
import '../components/reusable_round_icon_button.dart';
import '../constants.dart';
import 'results_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 69;
  int weight = 144;
  int age = 21;
  bool changedUnits = false;
  String chosenUnitOfMass = 'lbs';
  String chosenUnitOfLength = 'in';
  bool buttonPressed = false;
  bool loopActive = false;

  void increaseHeightWhilePressed() async {
    if (loopActive) return;
    loopActive = true;
    while (buttonPressed) {
      setState(() {
        height++;
      });
      await Future.delayed(Duration(milliseconds: 100));
    }
    loopActive = false;
  }

  void decreaseHeightWhilePressed() async {
    if (loopActive) return;
    loopActive = true;
    while (buttonPressed) {
      setState(() {
        height--;
      });
      await Future.delayed(Duration(milliseconds: 100));
    }
    loopActive = false;
  }

  void increaseAgeWhilePressed() async {
    if (loopActive) return;
    loopActive = true;
    while (buttonPressed) {
      setState(() {
        age++;
      });
      await Future.delayed(Duration(milliseconds: 100));
    }
    loopActive = false;
  }

  void decreaseAgeWhilePressed() async {
    if (loopActive) return;
    loopActive = true;
    while (buttonPressed) {
      setState(() {
        age--;
      });
      await Future.delayed(Duration(milliseconds: 100));
    }
    loopActive = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI Calculator'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ReusableIcon(
                      icon: FontAwesomeIcons.mars,
                      text: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ReusableIcon(
                      icon: FontAwesomeIcons.venus,
                      text: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Weight',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        weight.toString(),
                        style: kNumberStyle,
                      ),
                      SizedBox(width: 7.5),
                      Container(
                        height: 30.0,
                        width: 30.0,
                        child: FlatButton(
                          padding: EdgeInsets.all(0.0),
                          child: Text(
                            chosenUnitOfMass,
                            style: kTextStyle,
                          ),
                          onPressed: () {
                            setState(() {
                              changedUnits = !changedUnits;
                              if (changedUnits == true) {
                                chosenUnitOfLength = 'cm';
                                chosenUnitOfMass = 'kgs';
                              } else {
                                chosenUnitOfLength = 'in';
                                chosenUnitOfMass = 'lbs';
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: weight.toDouble(),
                      min: 41.0,
                      max: 450.0,
                      onChanged: (double newValue) {
                        setState(() {
                          weight = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Height',
                          style: kTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberStyle,
                            ),
                            SizedBox(width: 1.5),
                            Container(
                              height: 30.0,
                              width: 27.0,
                              child: FlatButton(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  chosenUnitOfLength,
                                  style: kTextStyle,
                                ),
                                onPressed: () {
                                  setState(() {
                                    changedUnits = !changedUnits;
                                    if (changedUnits == true) {
                                      chosenUnitOfLength = 'cm';
                                      chosenUnitOfMass = 'kgs';
                                    } else {
                                      chosenUnitOfLength = 'in';
                                      chosenUnitOfMass = 'lbs';
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ReusableRoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  height--;
                                });
                              },
                              onLongPress: () {
                                buttonPressed = true;
                                decreaseHeightWhilePressed();
                              },
                              onLongPressUp: () {
                                buttonPressed = false;
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            ReusableRoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  height++;
                                });
                              },
                              onLongPress: () {
                                buttonPressed = true;
                                increaseHeightWhilePressed();
                              },
                              onLongPressUp: () {
                                buttonPressed = false;
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              age.toString(),
                              style: kNumberStyle,
                            ),
                            SizedBox(width: 7.5),
                            Text(
                              'yrs',
                              style: kTextStyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ReusableRoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              onLongPress: () {
                                buttonPressed = true;
                                decreaseAgeWhilePressed();
                              },
                              onLongPressUp: () {
                                buttonPressed = false;
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            ReusableRoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              onLongPress: () {
                                buttonPressed = true;
                                increaseAgeWhilePressed();
                              },
                              onLongPressUp: () {
                                buttonPressed = false;
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ReusableBottomButton(
            buttonText: 'Calculate',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                height: height,
                weight: weight,
                changedUnits: changedUnits,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(
                      bmiResult: calc.calculateInChosenUnits(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
