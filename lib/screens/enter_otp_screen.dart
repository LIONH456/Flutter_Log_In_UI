import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/helper/style.dart';
import 'package:myapp/screens/reset_password_screen.dart';

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

class EnterOtpScreen extends StatefulWidget {
  const EnterOtpScreen({super.key});

  @override
  State<EnterOtpScreen> createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> {
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());

  @override
  void dispose() {
    for (final c in _controllers) c.dispose();
    for (final f in _focusNodes) f.dispose();
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
    setState(() {});
  }

  String get _otp => _controllers.map((e) => e.text).join();

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
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(20),
                children: [
            SizedBox(height: 16),
            Center(
              child: Text(
                'Enter OTP',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  color: StyleColor.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Enter the OTP code we just sent you on your registered Email/Phone number',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: StyleColor.description,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 24),
            LayoutBuilder(
              builder: (context, constraints) {
                const double spacing = 8;
                const int boxes = 6;
                final double calcWidth =
                    (constraints.maxWidth - spacing * (boxes - 1)) / boxes;
                final double fieldWidth = calcWidth.clamp(40, 56);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return SizedBox(
                      width: fieldWidth,
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        onChanged: (v) => _onChanged(index, v),
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: StyleColor.filedBackground,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
            SizedBox(height: 32),
            TextButton(
              onPressed: _otp.length == 6
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetPasswordScreen(),
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
                'Reset Password',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Didn't get OTP? ",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: StyleColor.description,
                      ),
                    ),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('OTP resent')),
                          );
                        },
                        child: Text(
                          'Resend OTP',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: StyleColor.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
              ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: _ProgressDots(activeIndex: 1),
            ),
          ],
        ),
      ),
    );
  }
}


