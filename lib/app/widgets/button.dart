import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    this.colorBackground = Colors.white,
    this.colorLetter = Colors.green,
    this.height = 50.0,
    Key? key,
    required this.label,
    required this.onTap,
    this.sizeLetter = 28,
    this.width = 250.0,
  }) : super(key: key);

  final Color colorBackground;
  final Color colorLetter;
  final double height;
  final String label;
  final void Function() onTap;
  final double sizeLetter;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorBackground,
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 10,
                color: Colors.black.withOpacity(0.6),
                offset: const Offset(4, 6),
              )
            ]),
        width: width,
        child: Text(
          label,
          style: TextStyle(
            color: colorLetter,
            fontSize: sizeLetter,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
