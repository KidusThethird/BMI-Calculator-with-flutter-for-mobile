
import 'package:flutter/material.dart';
import 'constants.dart';


class mywidget extends StatelessWidget {

  mywidget({@required this.IconText , this.myIcon});

  final String IconText;
  final IconData myIcon;



  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          //Icons.assignment_ind,
          myIcon ,

          color: Colors.yellowAccent,

          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
            IconText, style:klabelTextStyle,
        ),
      ],
    );
  }
}
