import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
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
              borderRadius: BorderRadius.circular(radius ?? 10.0),
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

class SearchTextFieldUnderlined extends StatelessWidget {
  final TextEditingController? controller;
  const SearchTextFieldUnderlined({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.grey),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CustomTheme.primaryColor,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}

class TextFieldFilled extends StatelessWidget {
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool? obscureText;
  final String labelText;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  const TextFieldFilled({
    Key? key,
    required this.labelText,
    this.initialValue,
    this.textInputType,
    this.controller,
    this.obscureText,
    this.validator,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: validator,
      initialValue: initialValue,
      builder: (FormFieldState<String> state) {
        return Column(
          children: [
            TextFormField(
              focusNode: focusNode,
              onChanged: (v) {
                state.didChange(v);
              },
              onSaved: (v) {
                state.save();
              },
              onFieldSubmitted: (v) {
                state.save();
              },
              controller: controller,
              keyboardType: textInputType,
              obscureText: obscureText ?? false,
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).errorColor,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelStyle: TextStyle(
                  fontSize: CustomTheme.bodyText1.sp(context),
                  color: const ColorScheme.light().onSecondary,
                ),
                labelText: labelText,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: CustomTheme.primaryColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: CustomTheme.greyColor,
              ),
            ),
            Offstage(
              offstage: !state.hasError,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 10.0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Icon(
                        Icons.error,
                        color: Theme.of(context).errorColor,
                        size: CustomTheme.bodyText1.sp(context),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${state.errorText}",
                        style: TextStyle(
                          color: Theme.of(context).errorColor,
                          fontSize: CustomTheme.bodyText2.sp(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
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

class Avatar extends StatelessWidget {
  final double? height;
  final double? width;
  const Avatar({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 70.sp(context),
      width: width ?? 70.sp(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.w(context)),
        color: CustomTheme.greyColor,
      ),
      child: const Center(
        child: Icon(
          Icons.person,
          size: 30,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class ContainerRoundedGrey extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  const ContainerRoundedGrey({
    required this.child,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
        color: CustomTheme.greyColor,
      ),
      child: child,
    );
  }
}

class SuccessIcon extends StatelessWidget {
  final double? width;
  final double? height;
  const SuccessIcon({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 50,
      height: height ?? 50,
      child: Image.asset(
        "${assetsImages}success.png",
        color: CustomTheme.secondaryColor,
        fit: BoxFit.contain,
      ),
    );
  }
}
