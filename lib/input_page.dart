import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'card_details.dart';
import 'constants.dart';
import 'custom_button.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'bmi_calculator.dart';

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
  int height = 180;
  int weight = 60;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kSelectedColor
                        : kDeSelectedColor,
                    cardChild: CardDetails(
                      cardIcon: FontAwesomeIcons.mars,
                      cardText: 'MALE',
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
                    colour: selectedGender == Gender.female
                        ? kSelectedColor
                        : kDeSelectedColor,
                    cardChild: CardDetails(
                      cardIcon: FontAwesomeIcons.venus,
                      cardText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
//Height and slider section below
          Expanded(
            child: ReusableCard(
              colour: kSelectedColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTextStyleThin,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: kTextStyleThick,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        'cm',
                        style: kTextStyleThin,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTickMarkColor: Color(0xFFFFFFFF),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 250.0,
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight.round();
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
              children: [
//Weight card section below
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTextStyleThin,
                        ),
                        Text(
                          weight.toString(),
                          style: kTextStyleThick,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              onLongPress: () {
                                setState(
                                  () {
                                    weight--;
                                  },
                                );
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kSelectedColor,
                  ),
                ),
//Age card Section below
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      children: [
                        Text(
                          'AGE',
                          style: kTextStyleThin,
                        ),
                        Text(
                          age.toString(),
                          style: kTextStyleThick,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kSelectedColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: 'CALCULATE',
            onTap: () {
              BmiCalculator cal = BmiCalculator(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: cal.bmi(),
                    heading: cal.heading(),
                    interpretation: cal.interpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
