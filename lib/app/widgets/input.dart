import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomInput({
    super.key,
    required this.icon,
    required this.placeholder,
    required this.textController,
    required this.keyboardType,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 1, left: 5, bottom: 5, right: 20),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: const Color(0xffF2F2F2),
        borderRadius: BorderRadius.circular(30),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 5),
            blurRadius: 5,
          ),
        ],
      ),
      child: TextField(
        controller: textController,
        textAlignVertical: TextAlignVertical.center,
        autocorrect: false,
        keyboardType: keyboardType,
        obscureText: isPassword,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: placeholder),
      ),
    );
  }
}
