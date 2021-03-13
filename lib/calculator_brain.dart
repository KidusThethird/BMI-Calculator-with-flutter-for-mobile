import 'dart:math';


class CalculatorBrain{

  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double bmi;

  String calcuateBMI(){
     bmi = weight / pow(height/100 , 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult(){
    if (bmi  >=25){
      return 'OverWeight';

    }else if (bmi >18.5){
      return 'Normal';

    }
    else{
      return 'UnderWeight';
    }
  }

  String getIneterpritation(){
    if (bmi  >=25){
      return 'You have a higher BMI than normal body weight. Try to exercise more.';

    }else if (bmi >18.5){
      return 'You have a normal body weight. Good job!';

    }
    else{
      return 'You have a lower BMI than normal body. You might need to eat more.';
    }
  }
}