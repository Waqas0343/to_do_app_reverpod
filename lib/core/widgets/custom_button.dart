import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final bool isLoading;
  final Color? color;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.height = 50,
    this.isLoading = false,
    this.color,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 2,
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ?  CircularProgressIndicator(
          color: Colors.white,
        )
            : Text(
            title,
            style: textStyle ??
                Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.textLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )
        ),
      ),
    );
  }
}
