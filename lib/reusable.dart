
import 'package:flutter/material.dart';
class MyContainer extends StatelessWidget {

  MyContainer({@required this.mycolor , this.cardChild, this.onPress});

  final Color mycolor;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: mycolor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}


