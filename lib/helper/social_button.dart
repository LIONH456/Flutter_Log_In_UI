import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myapp/helper/style.dart';

class SocialButton extends StatelessWidget {
  final String? icon;
  final String? label;
  final void Function() onPressed;

  const SocialButton({
    super.key,
    required this.onPressed,
    this.icon,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        padding: WidgetStatePropertyAll(EdgeInsets.all(16)),
        backgroundColor: WidgetStatePropertyAll(StyleColor.filedBackground),
      ),

      child: Row(
        children: [
          icon == null
              ? SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Image.asset(icon!, width: 24),
                ),
          Text(
            label ?? '',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: StyleColor.description,
            ),
          ),
        ],
      ),
    );
  }
}
