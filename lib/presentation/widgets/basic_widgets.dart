import 'package:clicar/core/utils/constants.dart';
import 'package:clicar/core/utils/extension.dart';
import 'package:clicar/core/utils/theme.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  final MaterialStateProperty<EdgeInsetsGeometry>? padding;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? elevation;
  final double? height;
  final double? width;
  final void Function()? onPressed;
  final double? radius;
  const PrimaryButton({
    required this.child,
    Key? key,
    this.onPressed,
    this.margin,
    this.padding,
    this.borderColor,
    this.backgroundColor,
    this.elevation,
    this.height,
    this.width,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin ?? const EdgeInsets.all(0),
      child: TextButton(
        style: ButtonStyle(
          padding: padding ??
              MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 60.0),
              side: BorderSide(color: borderColor ?? Colors.transparent),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            backgroundColor ?? CustomTheme.primaryColor,
          ),
        ),
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  final MaterialStateProperty<EdgeInsetsGeometry>? padding;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? elevation;
  final double? height;
  final double? width;
  final void Function()? onPressed;
  final double? radius;
  const SecondaryButton({
    required this.child,
    Key? key,
    this.onPressed,
    this.margin,
    this.padding,
    this.borderColor,
    this.backgroundColor,
    this.elevation,
    this.height,
    this.width,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin ?? const EdgeInsets.all(0),
      child: TextButton(
        style: ButtonStyle(
          padding: padding ??
              MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 0.0),
              side: BorderSide(color: borderColor ?? Colors.grey, width: 0.5),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            backgroundColor ?? CustomTheme.greyColor,
          ),
        ),
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}

class TextFieldFilled extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool? obscureText;
  final String labelText;
  const TextFieldFilled({
    Key? key,
    required this.labelText,
    this.textInputType,
    this.controller,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            fontSize: CustomTheme.bodyText1.sp(context),
            color: const ColorScheme.light().onSecondary,
          ),
          labelText: labelText,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          border: InputBorder.none,
          filled: true,
          fillColor: CustomTheme.greyColor,
        ),
      ),
    );
  }
}

class TitleWithSeparator extends StatelessWidget {
  final String title;
  const TitleWithSeparator({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 2,
            color: CustomTheme.primaryColor,
            margin: const EdgeInsets.only(
              right: CustomTheme.defaultPadding,
            ),
          ),
        ),
        Text(
          title.toUpperCase(),
          style: TextStyle(
            color: CustomTheme.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: CustomTheme.headline1.sp(context),
          ),
        ),
        Expanded(
          child: Container(
            height: 2,
            color: CustomTheme.primaryColor,
            margin: const EdgeInsets.only(
              left: CustomTheme.defaultPadding,
            ),
          ),
        ),
      ],
    );
  }
}

class BottomLogo extends StatelessWidget {
  const BottomLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: UnconstrainedBox(
        child: Image.asset(
          "${assetsImages}clicar_logo.png",
          scale: 7.sp(context),
          color: CustomTheme.primaryColor,
        ),
      ),
    );
  }
}
