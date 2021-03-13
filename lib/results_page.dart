import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'input_page.dart';

class ReslutsPage extends StatelessWidget {


  ReslutsPage({@required this.interpritation, this.bmiResult, this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpritation;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('BMI CALCULATOR'),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 50.0),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: MyContainer(
              mycolor: kinactivecolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText, style: TextStyle(color: Colors.green, fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(fontSize: 100.0),
                  ),
                  Center(
                    child: Text(
                      interpritation,
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print('calculat pressed');
                      Navigator.pop(context, MaterialPageRoute(builder: (context){
                        return InputPage();
                      }));
                    },
                    child: Container(
                      //alignment: MainAxisAlignment.center,
                      child: Center(child: Text('Re-Calculate BMI', style: kweightedText,)),
                      color:Color(0xFFA3A141),
                      margin: EdgeInsets.only(top: 10.0),
                      width: double.infinity,
                      height: bottomContainerHeight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
