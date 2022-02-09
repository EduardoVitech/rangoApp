import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RangoRoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final double fontsize;

  const RangoRoundedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.fontsize = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontsize,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        primary: Colors.purple,
      ),
    );
  }
}
