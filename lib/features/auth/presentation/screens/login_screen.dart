import 'package:flutter/material.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade50,
              Colors.purple.shade50,
              Colors.pink.shade50,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: isWide ? 420 : double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: isWide ? 24 : 16,
                  vertical: screenHeight * 0.05,
                ),
                padding: EdgeInsets.all(isWide ? 32 : 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(isWide ? 24 : 16),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 15),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      blurRadius: 60,
                      color: Colors.blue.withOpacity(0.05),
                      offset: const Offset(0, 30),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const LoginForm(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}