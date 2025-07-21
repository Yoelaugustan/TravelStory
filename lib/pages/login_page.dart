import 'package:flutter/material.dart';
import 'package:travel_story/auth/auth_service.dart';
import 'package:travel_story/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // Get Auth Service
  final authService = AuthService();

  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Login Button Pressed
  void login() async {
    // prepare data
    final email = _emailController.text;
    final password = _passwordController.text;

    // Check if fields is not empty
    if(email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Fill All Fields!")));
      return;
    }

    // attempt login...
    try {
      await authService.signInWithEmailPassword(email, password);
    } catch(e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

  // Build UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
        children: [
          // email
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: "Email"),
          ),

          // Password
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: "Password"),
          ),

          const SizedBox(height: 12),

          // button
          ElevatedButton(
            onPressed: login, 
            child: const Text("Login")
          ),

          const SizedBox(height: 12),

          GestureDetector(
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const RegisterPage(),
              )
            ),
            child: const Center(child: Text("Don't have an account? Sign Up"))
          )
        ],
      )
    );
  }
}