import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travel_story/auth/auth_gate.dart';

void main() async {

  await Supabase.initialize(
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImttcWJhdXBhZHRhdm9idGZ6ZWZmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNzU2MTksImV4cCI6MjA2ODY1MTYxOX0.1n0CspROEPPNm1JkW1foomoCkFgrUwkzWcAiq7vJeiM",
    url: "https://kmqbaupadtavobtfzeff.supabase.co",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
