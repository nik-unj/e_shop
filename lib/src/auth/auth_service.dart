import 'package:e_shop/src/features/bottom_bar/bottom_bar.dart';
import 'package:e_shop/src/features/login/login_screen.dart';
import 'package:flutter/material.dart';

class AuthService extends StatefulWidget {
  const AuthService({super.key});

  @override
  State<AuthService> createState() => _AuthServiceState();
}

class _AuthServiceState extends State<AuthService> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoggedIn ? const BottomBar() : const LoginScreen(),
    );
  }
}
