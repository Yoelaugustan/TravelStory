import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travel_story/auth/auth_service.dart';
import 'package:travel_story/pages/main_page.dart';
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
      final response = await authService.signInWithEmailPassword(email, password);
      if (response.session != null) {
        print("Login successful: ${response.session!.user.email}");
        
        // Wait a moment for the auth state to propagate
        await Future.delayed(const Duration(milliseconds: 500));
        
        // Navigate to main page explicitly or pop back to AuthGate
        if (mounted) {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => const MainPage())
          );
        }
        
      } else {
        throw Exception("Login failed - no session created");
      }
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
      body: Container(
        color: const Color(0xFF4CB9E7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Welcome Back !',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  Text(
                    'Login To Continue',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 60),

            // Form
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 14),
                decoration: const BoxDecoration(
                  color: Color(0xFFF9F9F9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: ListView(
                  children: [
                    // email
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFE3E3E3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        )
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Password
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFE3E3E3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        )
                      ),
                    ),

                    const SizedBox(height: 24),

                    // button
                    Center(
                      child: SizedBox(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4CB9E7),
                            foregroundColor: Color(0xFF2E2E2E),
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          child: const Text("Login")
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Don't Have an Account? ",
                          style: const TextStyle(
                            color: Color(0xFF2E2E2E),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: const TextStyle(
                                color: Color(0xFF4CB9E7),
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  )
                                ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}