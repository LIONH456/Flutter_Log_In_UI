import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/helper/style.dart';
import 'package:myapp/screens/login_screen.dart';

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleColor.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success Icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: StyleColor.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle,
                  size: 80,
                  color: StyleColor.primary,
                ),
              ),
              SizedBox(height: 32),

              // Success Title
              Text(
                'Account Created!',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: StyleColor.primary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),

              // Success Message
              Text(
                'Your account has been successfully created. You can now sign in to your account.',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: StyleColor.description,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 48),

              // Sign In Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: StyleColor.primary,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 30,
                    shadowColor: StyleColor.primary.withValues(alpha: 0.25),
                  ),
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Welcome Message
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: StyleColor.primary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: StyleColor.primary.withValues(alpha: 0.1),
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.celebration,
                      size: 32,
                      color: StyleColor.primary,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Welcome to Our App!',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: StyleColor.primary,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'We\'re excited to have you on board. Start exploring our features!',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: StyleColor.description,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
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
