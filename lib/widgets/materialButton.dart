import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MaterialButonGoogle extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const MaterialButonGoogle({
    Key? key,
    required this.title,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: this.onPressed,
      splashColor: Colors.transparent,
      minWidth: double.infinity,
      height: 40,
      color: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon( FontAwesomeIcons.google, color: Colors.white,),
          Text(' ${this.title}', style: TextStyle( color: Colors.white, fontSize: 17),)
        ],
      ),
    );
  }
}