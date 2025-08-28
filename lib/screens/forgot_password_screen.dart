import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/helper/pos_text_form_field.dart';
import 'package:myapp/helper/style.dart';
import 'package:myapp/enum/pos_text_form_field_validation_rule.dart';
import 'package:myapp/screens/enter_otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _contactController = TextEditingController();

  @override
  void dispose() {
    _contactController.dispose();
    super.dispose();
  }

  bool _isValid(String? value) {
    if (value == null || value.trim().isEmpty) return false;
    final String input = value.trim();
    final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    final RegExp phoneRegex = RegExp(r'^\+?[\d\s\-\(\)]{10,}$');
    return emailRegex.hasMatch(input) || phoneRegex.hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: StyleColor.background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(20),
                  children: [
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Forget Password',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    color: StyleColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'It was popularised in the 1960s with the release of Letraset sheetscontaining Lorem Ipsum.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: StyleColor.description,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24),
              PosTextFormField(
                controller: _contactController,
                placeholder: "Email I'D/ Mobile Number",
                rule: PosTextFormFieldValidationRule.text,
                onChanged: (p0) {
                  setState(() {});
                  return null;
                },
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "Email or mobile number is required";
                  }
                  if (!_isValid(p0)) {
                    return "Enter a valid email or phone number";
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              TextButton(
                onPressed: (_formKey.currentState?.validate() ?? false)
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EnterOtpScreen(),
                          ),
                        );
                      }
                    : null,
                style: ButtonStyle(
                  elevation: WidgetStatePropertyAll(30),
                  shadowColor: WidgetStatePropertyAll(
                    StyleColor.primary.withValues(alpha: 0.25),
                  ),
                  backgroundColor: WidgetStateColor.resolveWith(
                    (states) => states.contains(WidgetState.disabled)
                        ? StyleColor.primary.withValues(alpha: 0.25)
                        : StyleColor.primary,
                  ),
                  padding: WidgetStatePropertyAll(EdgeInsets.all(18)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 48,
                      height: 6,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: StyleColor.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 6,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: StyleColor.primary.withValues(alpha: 0.25),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 6,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: StyleColor.primary.withValues(alpha: 0.25),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


