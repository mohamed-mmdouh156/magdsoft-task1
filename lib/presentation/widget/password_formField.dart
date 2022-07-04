import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/value_manager.dart';

class PasswordFormField extends StatefulWidget {
  String? label;
  IconData prefixIcon;
  TextInputType textInputType;
  TextEditingController controller;
  String? textValidator;

  PasswordFormField({
    Key? key,
    required this.label,
    required this.textInputType,
    required this.controller,
    required this.textValidator,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.lightGrey,
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
      child: TextFormField(
        decoration:  InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(
            fontSize: 15,
            color:AppColor.darkGrey,
          ),
          helperStyle: const TextStyle(),
          enabledBorder:  OutlineInputBorder(
            borderSide:  const BorderSide(width: 2,color: AppColor.darkGrey),
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
          border:  OutlineInputBorder(
            borderSide:  const BorderSide(width: 2,color: AppColor.darkGrey),
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:  const BorderSide(width: 2,color: AppColor.darkGrey),
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: AppColor.darkGrey,
          ),
          suffixIcon: IconButton(
            onPressed: (){
              setState((){
                showPassword =! showPassword;
              });
            },
            icon: Icon(
              showPassword ? Icons.visibility_off : Icons.visibility,
              color: AppColor.darkGrey,
            ),
          ),
        ),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        keyboardType: widget.textInputType,
        controller: widget.controller ,
        obscureText: showPassword,
        validator: (value){
          if(value!.isEmpty){
            return widget.textValidator;
          }
        },
      ),
    );
  }
}
