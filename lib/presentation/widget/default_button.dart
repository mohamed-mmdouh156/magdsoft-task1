import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/string_manager.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/value_manager.dart';

class DefaultButton extends StatelessWidget {
  String? text;
  Function () onClick;
  double? width ;
  double? height;
   DefaultButton({
    Key? key,
    required this.text,
    required this.onClick,
    this.width = double.infinity,
    this.height = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
      child: MaterialButton(
        elevation: 0.0,
        onPressed: onClick,
        child:  Text(
          text!,
          style: const TextStyle(
            color: AppColor.white,
            fontSize: AppSize.s18,
          ),
        ),
      ),
    );
  }
}
