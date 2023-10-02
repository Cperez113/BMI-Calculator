import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:new_app/calculator.dart";
import "package:new_app/constants.dart";
import "package:new_app/main.dart";
import "package:new_app/result_page.dart";
import "package:new_app/reusable_card.dart";
import "result_page.dart";
import "calculator.dart";

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender activeGender = Gender.male;
  int height = 128;
  int weight = 45;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMICalculator"),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              // each time Expanded is created this makes a new row (could do column instead if I wanted to)
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: activeGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 80,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Male',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      onPress: () {
                        setState(() {
                          activeGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: activeGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.venus,
                            size: 80,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Female',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      onPress: () {
                        setState(() {
                          activeGender = Gender.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Colors.black,
                        activeTrackColor: Colors.white,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        trackHeight: 1,
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 200,
                        onChanged: (double value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                      ),
                    ),
                    Text(
                      'Height',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                onPress: () {},
              ),
            ),
            Expanded(
              // each time Expanded is created this makes a new row (could do column instead if I wanted to)
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                            ],
                          )
                        ],
                      ),
                      onPress: () {},
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                            ],
                          )
                        ],
                      ),
                      onPress: () {},
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Calculate bmiCalculate =
                    new Calculate(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: bmiCalculate.calculateBMI(),
                      result: bmiCalculate.getResults(),
                      review: bmiCalculate.getReview(),
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(
                    16.0), // padding to make button not touch edges of screen
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0), // Radius of button
                  child: Container(
                    width: double.infinity,
                    height: kBottomContainerHeight,
                    color: kBottomContainerColor,
                    child: Center(
                      child: Text(
                        'Calculate',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onTap});

  final Icon icon;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: icon,
      shape: CircleBorder(),
      fillColor: kButtonColor,
      onPressed: () {
        onTap();
      },
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      elevation: 7,
    );
  }
}
