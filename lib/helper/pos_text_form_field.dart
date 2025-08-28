import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/enum/pos_text_form_field_validation_rule.dart';
import 'package:myapp/helper/style.dart';

class PosTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final String? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isObsecure;
  final PosTextFormFieldValidationRule? rule;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;

  const PosTextFormField({
    super.key,
    this.controller,
    this.placeholder,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.isObsecure = false,
    this.rule,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsecure,
      style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
      keyboardType: _getKeyboardType(),
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: StyleColor.filedBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        hintText: placeholder,
        hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: label,
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: StyleColor.primary, width: 1.5),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }

  TextInputType _getKeyboardType() {
    switch (rule) {
      case PosTextFormFieldValidationRule.digitNumber:
        return TextInputType.numberWithOptions(decimal: false);
      case PosTextFormFieldValidationRule.decimalNumber:
        return TextInputType.numberWithOptions(decimal: true);
      case PosTextFormFieldValidationRule.email:
        return TextInputType.emailAddress;
      case PosTextFormFieldValidationRule.phone:
        return TextInputType.phone;
      case PosTextFormFieldValidationRule.password:
        return TextInputType.visiblePassword;
      default:
        return TextInputType.text;
    }
  }
}
