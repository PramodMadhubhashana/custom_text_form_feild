import 'package:flutter/material.dart';

class CustomTextFeild extends StatefulWidget {
  final CustomePadding? customePadding;
  final Text? labelText;
  final String? hintText;
  final Function(String)? onChange;
  final TextStyle? labelTextTextStyle;
  final TextStyle? hintTextStyle;
  final Widget? prefix;
  final Widget? sufix;
  final TextInputType? textInputType;
  final int? maxLine;
  final String? initialValue;
  final bool? enbale;
  final String? errorMessage;
  final TextStyle? errorMessageStyle;
  final int? maxLength;
  final String? counterText;
  final RegExp? regExp;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final bool? readOnly;
  final Color? cursorErrorColor;

  const CustomTextFeild({
    super.key,
    this.customePadding,
    this.labelText,
    this.onChange,
    this.hintText,
    this.labelTextTextStyle,
    this.hintTextStyle,
    this.prefix,
    this.sufix,
    this.textInputType,
    this.maxLine,
    this.initialValue,
    this.enbale = true,
    this.errorMessage,
    this.errorMessageStyle,
    this.maxLength,
    this.counterText,
    this.regExp,
    this.obscureText,
    this.validator,
    this.onTap,
    this.readOnly,
    this.cursorErrorColor,
  });

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  TextEditingController textEditingController = TextEditingController();

  String? errorMessage;

  @override
  void initState() {
    textEditingController.addListener(() {
      if (!_inputValidation()) {
        setState(() {
          errorMessage = widget.errorMessage;
        });
      } else {
        setState(() {
          errorMessage = null;
        });
      }
    });
    super.initState();
  }

  bool _inputValidation() {
    final String input = textEditingController.text.trim();
    if (widget.regExp != null) {
      if (widget.regExp!.hasMatch(input)) {
        return true;
      }
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: widget.customePadding?.right ?? 8,
        bottom: widget.customePadding?.bottom ?? 8,
        top: widget.customePadding?.top ?? 8,
        left: widget.customePadding?.left ?? 8,
      ),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          label: widget.labelText,
          labelStyle: widget.labelTextTextStyle,
          hintText: widget.hintText,
          hintStyle: widget.hintTextStyle,
          prefix: widget.prefix,
          suffix: widget.sufix,
          enabled: widget.enbale!,
          errorText: errorMessage,
          errorStyle: widget.errorMessageStyle,
          counterText: widget.counterText ?? "",
        ),
        initialValue: widget.initialValue,
        keyboardType: widget.textInputType ?? TextInputType.text,
        maxLines: widget.maxLine,
        maxLength: widget.maxLength,
        onChanged: widget.onChange,
        obscureText: widget.obscureText ?? false,
        validator: widget.validator,
        onTap: widget.onTap,
        readOnly: widget.readOnly ?? false,
        cursorErrorColor: widget.cursorErrorColor,
      ),
    );
  }
}

class CustomePadding {
  final double right;
  final double bottom;
  final double top;
  final double left;

  CustomePadding({
    required this.right,
    required this.bottom,
    required this.top,
    required this.left,
  });
}
