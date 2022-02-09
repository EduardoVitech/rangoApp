import 'package:flutter/material.dart';

class RangoAppbar extends AppBar {
  RangoAppbar({
    Key? key,
    double elevation = 2,
  }) : super(
          key: key,
          backgroundColor: Colors.black,
          elevation: elevation,
          centerTitle: true,
          title: Image.asset(
            'assets/images/RangoIcon.png',
            width: 38,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        );
}
