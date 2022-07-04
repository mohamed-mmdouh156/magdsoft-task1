import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/value_manager.dart';

class DefaultFormField extends StatelessWidget {
  String? label;
  IconData prefixIcon;
  TextInputType textInputType;
  TextEditingController controller;
  String? textValidator;

    DefaultFormField({
    Key? key,
    required this.label,
    required this.textInputType,
    required this.controller,
    required this.textValidator,
    required this.prefixIcon,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.lightGrey,
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
      child: TextFormField(
        decoration:  InputDecoration(
          labelText: label,
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
            prefixIcon,
            color: AppColor.darkGrey,
          ),

        ),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        keyboardType: textInputType,
        controller: controller ,
        validator: (value){
          if(value!.isEmpty){
            return textValidator;
          }
        },
      ),
    );
  }
}
