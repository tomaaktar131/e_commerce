import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final bool obscure;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.obscure = false,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,


      obscureText: obscure,
      controller: controller ,
      decoration: InputDecoration(
        suffixIcon:suffixIcon ,
          prefixIcon:prefixIcon,
          labelText:label,
          hintText: hint,
          border: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey
              )
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey
              )
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey
              )
          )



      ),
    );
  }
}
