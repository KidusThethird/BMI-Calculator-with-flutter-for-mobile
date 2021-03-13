import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator_brain.dart';

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'font_awesome_package';
//import 'package:font_awesome_flutter_flutter.darter/font_awesome';


enum Gender {male, female}
Gender selectedGender;
////0xFF1D1E33
// 1 for male and 2 for female
Color maleCardColor;
Color femaleCardColor;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  int height = 180;
  int weight = 60;
  int Age = 19;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child:MyContainer(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                        print('male is slected');
                      });
                    },
                    mycolor: selectedGender==Gender.male ? kactivecolor : kinactivecolor ,
                  cardChild: mywidget(IconText: "Male", myIcon: FontAwesomeIcons.male ),
                ),),
              Expanded(
                child:MyContainer(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                      print('female is slected');
                    });
                  },
                  mycolor: selectedGender==Gender.female ? kactivecolor : kinactivecolor ,
                cardChild: mywidget(IconText: "Female", myIcon: FontAwesomeIcons.female ),
                ),),
            ],
          )),
          Expanded(child: MyContainer(
            mycolor: kmybgcolor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text('Height' , style: klabelTextStyle,) ,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                Text(
                  height.toString(), style: kweightedText,
                ),
                Text(
                  ' cm', style: klabelTextStyle,
                )
              ],
              ),
               Slider(
                 activeColor: Colors.yellowAccent,
                 inactiveColor: Colors.grey,
                 value: height.toDouble(),
                 min: 120,
                   max: 220,
                 onChanged: (double newValue) {
                   print(newValue);

                   setState(() {
                     height = newValue.round();
                   });
                 },
               ),
              ],


            ),
          ),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child:MyContainer(
                mycolor:kmybgcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT', style: klabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kweightedText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },

                        ),
                        SizedBox(width: 10.0),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                        ),

                      ],
                    ),
                  ],
                ),
              ),),
              Expanded(child:MyContainer(
                mycolor: kmybgcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Age', style: klabelTextStyle,
                    ),
                    Text(
                      Age.toString(),
                      style: kweightedText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              Age--;
                            });
                          },

                        ),
                        SizedBox(width: 10.0),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              Age++;
                            });
                          },
                        ),

                      ],
                    ),
                  ],
                ),
              ),),
            ],
          )),
          GestureDetector(
            onTap: (){
    print('calculat pressed');

    CalculatorBrain calc= CalculatorBrain(height: height, weight: weight);

    Navigator.push(context, MaterialPageRoute(
        builder: (context) =>ReslutsPage(

        bmiResult: calc.calcuateBMI(),
        resultText: calc.getResult(),
        interpritation: calc.getIneterpritation(),

//            bmiResult: calc.calcuateBMI(),
//            resultText: calc.getResult(),
//
//             interpritation: calc.getResult(),
//
//            return ReslutsPage();
    ),
    ),
    );
    }  ,


            child: Container(
              //alignment: MainAxisAlignment.center,
              child: Center(child: Text('CALCULATE', style: kweightedText,)),
              color:Color(0xFFA3A141),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          ),
        ],
      )

    );
  }
}



class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child:Icon(icon),
      onPressed: onPressed,
      elevation: 60.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      fillColor: Color(0xFF4C4F5E),


    );
  }
}


