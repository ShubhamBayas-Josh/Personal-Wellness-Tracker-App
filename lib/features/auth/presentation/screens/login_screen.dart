import 'package:flutter/material.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Center(
        child: Container(
          width: isWide ? 420 : double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black12,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: const LoginForm(),
        ),
      ),
    );
  }
}
