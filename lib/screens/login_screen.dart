import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myapp/enum/pos_text_form_field_validation_rule.dart';
import 'package:myapp/helper/pos_text_form_field.dart';
import 'package:myapp/helper/social_button.dart';
import 'package:myapp/helper/style.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/main_screen.dart';
import 'package:myapp/screens/sign_up_screen.dart';
import 'package:myapp/screens/forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () {
        FocusScope.of(context).requestFocus(
          FocusNode(),
        ); // dismisses the keyboard when the user taps outside of a text field.
      },
      child: Scaffold(
        backgroundColor: StyleColor.background,
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              SizedBox(height: 56),
              Center(
                child: Text(
                  'Sign In',
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
              Row(
                children: [
                  // Facebook Button
                  Expanded(
                    child: SocialButton(
                      onPressed: () {
                        print("Login with Facebook");
                      },
                      label: 'Facebook',
                      icon: 'assets/images/facebook_icon.png',
                    ),
                  ),
                  SizedBox(width: 16),
                  // Google Button
                  Expanded(
                    child: SocialButton(
                      onPressed: () {
                        print("Login with Google");
                      },
                      label: 'Google',
                      icon: 'assets/images/google_icon.png',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Divider(color: StyleColor.description, endIndent: 8),
                  ),
                  Text(
                    'Or',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Divider(color: StyleColor.description, indent: 8),
                  ),
                ],
              ),
              SizedBox(height: 24),
              PosTextFormField(
                placeholder: 'Email',
                rule: PosTextFormFieldValidationRule.email,
                onChanged: (p0) {
                  setState(() {});
                },
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "Email is Required!";
                  }
                  RegExp emailRegex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (!emailRegex.hasMatch(p0)) {
                    return "Invalid email format";
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              PosTextFormField(
                placeholder: 'Password',
                isObsecure: isPassword,
                rule: PosTextFormFieldValidationRule.password,
                onChanged: (p0) {
                  setState(() {});
                },
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "Password is Required!";
                  }
                  if (p0.length < 6) {
                    return "Password must be at least 6 characters long";
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    isPassword = !isPassword;
                    setState(() {});
                  },
                  icon: Icon(
                    isPassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  ),
                  child: Text(
                    'Forget Password?',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: StyleColor.primary,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 32),
              TextButton(
                onPressed: (_formKey.currentState?.validate() ?? false)
                    ? () {
                        // print("Hello World!");
                        // Navigate to the new Page
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MainScreen()),
                          (route) => false,
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
                  'Login',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have account? ",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: StyleColor.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
