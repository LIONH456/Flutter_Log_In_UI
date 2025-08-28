import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/enum/pos_text_form_field_validation_rule.dart';
import 'package:myapp/helper/pos_text_form_field.dart';
import 'package:myapp/helper/social_button.dart';
import 'package:myapp/helper/style.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/sign_up_success_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPassword = true;
  bool isConfirmPassword = true;
  bool isAgreedToTerms = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Add controllers to track password values for comparison
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
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
                  'Sign Up',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: StyleColor.primary,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'It was popularised in the 1960s with the release of Letraset sheetscontaining Lorem Ipsum.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color.fromRGBO(97, 103, 125, 1),
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
                placeholder: 'Phone Number',
                rule: PosTextFormFieldValidationRule.text,
                onChanged: (p0) {
                  setState(() {});
                },
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "Phone Number is Required!";
                  }
                  RegExp phoneRegex = RegExp(r'^\+?[\d\s\-\(\)]{10,}$');
                  if (!phoneRegex.hasMatch(p0)) {
                    return "Invalid phone number format";
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              PosTextFormField(
                placeholder: 'Password',
                isObsecure: isPassword,
                rule: PosTextFormFieldValidationRule.password,
                controller: _passwordController,
                onChanged: (p0) {
                  setState(() {});
                  // Trigger validation for confirm password when password changes
                  if (_formKey.currentState != null) {
                    _formKey.currentState!.validate();
                  }
                },
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "Password is Required!";
                  }
                  RegExp passwordRegex = RegExp(
                    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{6,}$',
                  );
                  if (!passwordRegex.hasMatch(p0)) {
                    return "Password must include:\n• 6+ characters\n• Uppercase and lowercase letters\n• A number\n• A special character";
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
              SizedBox(height: 24),
              PosTextFormField(
                placeholder: 'Confirm Password',
                isObsecure: isConfirmPassword,
                rule: PosTextFormFieldValidationRule.password,
                controller: _confirmPasswordController,
                onChanged: (p0) {
                  setState(() {});
                  // Trigger validation when confirm password changes
                  if (_formKey.currentState != null) {
                    _formKey.currentState!.validate();
                  }
                },
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "Confirm Password is Required!";
                  }
                  // Check if passwords match
                  if (p0 != _passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    isConfirmPassword = !isConfirmPassword;
                    setState(() {});
                  },
                  icon: Icon(
                    isConfirmPassword
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: StyleColor.primary.withValues(alpha: 0.25),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: isAgreedToTerms,
                      onChanged: (value) {
                        setState(() {
                          isAgreedToTerms = value ?? false;
                        });
                      },
                      activeColor: StyleColor.primary,
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "I'm agree to The ",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Color.fromRGBO(97, 103, 125, 1),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'Terms of Service',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: StyleColor.primary,
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("Terms of Service clicked");
                                },
                            ),
                            TextSpan(
                              text: ' and ',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Color.fromRGBO(97, 103, 125, 1),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: StyleColor.primary,
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("Privacy Policy clicked");
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              TextButton(
                onPressed:
                    (_formKey.currentState?.validate() ?? false) &&
                        isAgreedToTerms
                    ? () {
                        // Navigate to success screen
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpSuccessScreen(),
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
                  'Create Account',
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
                        text: "Do you have account? ",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign In',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: StyleColor.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
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

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
