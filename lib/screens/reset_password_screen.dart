import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/enum/pos_text_form_field_validation_rule.dart';
import 'package:myapp/helper/pos_text_form_field.dart';
import 'package:myapp/helper/style.dart';
import 'package:myapp/screens/login_screen.dart';

class _ProgressDots extends StatelessWidget {
  final int activeIndex;
  const _ProgressDots({required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        final bool isActive = index == activeIndex;
        return Container(
          width: 48,
          height: 6,
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: isActive
                ? StyleColor.primary
                : StyleColor.primary.withValues(alpha: 0.25),
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }
}

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool isConfirmPassword = true;

  final TextEditingController _pwd = TextEditingController();
  final TextEditingController _confirm = TextEditingController();
  bool _submitting = false;

  @override
  void dispose() {
    _pwd.dispose();
    _confirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
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
                        'Reset Password',
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          color: StyleColor.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
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
                      controller: _pwd,
                      placeholder: 'New Password',
                      isObsecure: isPassword,
                      rule: PosTextFormFieldValidationRule.password,
                      onChanged: (_) {
                        setState(() {});
                        return null;
                      },
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'Password is Required!';
                        }
                        RegExp passwordRegex = RegExp(
                          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{6,}$',
                        );
                        if (!passwordRegex.hasMatch(p0)) {
                          return 'Password must include:\n• 6+ characters\n• Uppercase and lowercase\n• A number\n• A special character';
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        onPressed: () {
                          isPassword = !isPassword;
                          setState(() {});
                        },
                        icon: Icon(
                          isPassword
                              ? CupertinoIcons.eye_slash
                              : CupertinoIcons.eye,
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    PosTextFormField(
                      controller: _confirm,
                      placeholder: 'Confirm Password',
                      isObsecure: isConfirmPassword,
                      rule: PosTextFormFieldValidationRule.password,
                      onChanged: (_) {
                        setState(() {});
                        return null;
                      },
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'Confirm Password is Required!';
                        }
                        if (p0 != _pwd.text) {
                          return 'Passwords do not match';
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
                    SizedBox(height: 32),
                    TextButton(
                      onPressed: (_formKey.currentState?.validate() ?? false)
                          ? () async {
                              setState(() => _submitting = true);
                              await Future.delayed(Duration(milliseconds: 800));
                              if (!mounted) return;
                              setState(() => _submitting = false);
                              await showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (ctx) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: 72,
                                            height: 72,
                                            decoration: BoxDecoration(
                                              color: StyleColor.primary
                                                  .withValues(alpha: 0.1),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.check_circle,
                                              color: StyleColor.primary,
                                              size: 56,
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          Text(
                                            'Password Reset Successful',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'You can now sign in with your new password.',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: StyleColor.description,
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    StyleColor.primary,
                                                foregroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 14,
                                                ),
                                              ),
                                              child: Text('Go to Login'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                              if (!mounted) return;
                              // Ensure we land on LoginScreen explicitly
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (_) => const LoginScreen(),
                                ),
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
                      child: _submitting
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Submitting...',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              'Submit',
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
                child: _ProgressDots(activeIndex: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
