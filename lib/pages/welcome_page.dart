import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travel_story/pages/login_page.dart';
import 'package:travel_story/pages/register_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Image.asset('assets/welcome.png'),

            Text(
              'Plan Together, Travel Better',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800
              ),
            ),

            Text(
              'Craft your itinerary, collaborate',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            ),

            Text(
              'with friends, and inspire the world',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                )
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4CB9E7),
                foregroundColor: Color(0xFF2E2E2E),
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              child: const Text("Plan Now")
            ),
            
            SizedBox(height: 20),

            RichText(
              text: TextSpan(
                text: 'Already Have an Account? ',
                style: const TextStyle(
                  color: Color(0xFF2E2E2E),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: 'Login',
                    style: const TextStyle(
                      color: Color(0xFF4CB9E7),
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        )
                      ),
                  ),
                    
                ],
              ),
            ),
          ]
        ),
      )
    );
  }
}